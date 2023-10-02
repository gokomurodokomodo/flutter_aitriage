import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_aitriage/aitriage_core/entity/system_param.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/use_case/db/delete_collection_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/use_case/db/save_collection_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/use_case/download_and_parsing_json_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/use_case/fire_base/get_firebase_syncs_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/use_case/get_app_param_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/use_case/get_list_param_type_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/use_case/get_list_race_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/use_case/get_list_role_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/use_case/get_system_param_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/use_case/get_table_sync_date_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/use_case/get_user_info_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/use_case/db/load_collection_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/use_case/upload_image_uc.dart';
import 'package:flutter_aitriage/aitriage_core/util/app_event_channel/core/app_event_channel.dart';
import 'package:flutter_aitriage/aitriage_core/util/app_event_channel/custom_event/finish_sync_data.dart';
import 'package:get/get.dart';
import '../../entity/city.dart';
import '../../entity/country.dart';
import '../../entity/param_type.dart';
import '../../entity/race.dart';
import '../../entity/role.dart';
import '../../entity/state.dart';
import '../../entity/table_sync_date.dart';

typedef ParsedData = ({
  List<Country> countries,
  List<City> cities,
  List<State> states
});

typedef ComputeParam = ({
  String? countryUrl,
  String? cityUrl,
  String? stateUrl
});

class HiviService extends GetxService {
  // UseCase
  final getAppParamUC = GetAppParamUseCase();
  final getListParamTypeUC = GetListParamTypeUseCase();
  final getListRaceUC = GetListRaceUseCase();
  final getListRoleUC = GetListRoleUseCase();
  final getSystemParamUC = GetSystemParamUseCase();
  final getUserInfoUC = GetUserInfoUseCase();
  final getTableSyncDateUC = GetTableSyncDateUseCase();
  final saveCollectionUC = SaveCollectionUseCase();
  final loadCollectionUC = LoadCollectionUseCase();
  final deleteCollectionUC = DeleteCollectionUseCase();
  // Firebase listener use case
  final getFirebaseSyncDate = GetFirebaseSyncs();
  // Upload file
  final uploadImageUC = UploadImageUseCase();
  // Data
  final _countries = <Country>[];
  final _cities = <City>[];
  final _states = <State>[];
  final _races = <Race>[];
  final _roles = <Role>[];
  final _paramTypes = <ParamType>[];
  late SystemParam _systemParam;
  TableSyncDate? _firebaseSyncDate;
  TableSyncDate? _localSyncDate;

  static final _instance = HiviService._();

  HiviService._();

  static HiviService get instance => _instance;
  // country, city, state are json file, need parsing
  // FIRST TIME OPENING APP: get data
  // WHEN REOPENING APP: if local data exists, load local db
  Future<void> initLocalDB({
    Function? onSuccess,
    Function(dynamic)? onError
  }) async {
    try {
      _localSyncDate = await getTableSyncDateUC.execute();
      // FIRST TIME OPENING APP
      if (_localSyncDate == null) {
        await _updateParamType();
        await _updateRaces();
        await _updateSystemParam();
        final computeParam = (
            countryUrl: _systemParam.systemPathFileCountries,
            cityUrl: _systemParam.systemPathFileCity,
            stateUrl: _systemParam.systemPathFileStates
        );
        compute(_downloadAndParsingData, computeParam)
            .then((parsedData) => _handleParsingData(parsedData));
      // WHEN REOPENING APP
      } else {
        await _loadDbToSession();
      }

      onSuccess?.call();
    } catch (e) {
      onError?.call(e);
    }
  }

  Future<void> syncData({
    Function? onSuccess,
    Function(dynamic)? onError,
    TableSyncDate? firebaseSyncDate
  }) async {
    try {
      _localSyncDate = await getTableSyncDateUC.execute();
      _firebaseSyncDate = firebaseSyncDate;
      // Update data to session
      if (_shouldUpdateParamType) await _updateParamType();
      if (_shouldUpdateRaces) await _updateRaces();
      if (_shouldUpdateSystemParam) await _updateSystemParam();
      if (_shouldUpdateRoles) await _updateRoles();

      final computeParam = (
        countryUrl: _shouldUpdateCountries ? _systemParam.systemPathFileCountries : null,
        cityUrl: _shouldUpdateCities ? _systemParam.systemPathFileCity : null,
        stateUrl: _shouldUpdateStates ? _systemParam.systemPathFileStates : null
      );
      // Download json and update to session
      compute(_downloadAndParsingData, computeParam)
          .then((parsedData) => _handleParsingData(parsedData));
      onSuccess?.call();
    } catch (e) {
      onError?.call(e);
    }
  }

  Future<void> _updateParamType() async {
    final paramTypesResp = await getListParamTypeUC.execute();
    _paramTypes.clear();
    _paramTypes.addAll(paramTypesResp.data);
  }

  Future<void> _updateRaces() async {
    final racesResp = await getListRaceUC.execute();
    _races.clear();
    _races.addAll(racesResp.data);
  }

  Future<void> _updateSystemParam() async {
    final systemParamResp = await getSystemParamUC.execute();
    _systemParam = systemParamResp.data;
  }

  Future<void> _updateRoles() async {
    final rolesResp = await getListRoleUC.execute();
    _roles.clear();
    _roles.addAll(rolesResp.data);
  }

  // MUST BE STATIC OR GLOBAL FUNCTION OR ELSE GETTING POINTER ERROR IN ISOLATE
  // Only download and parsing data when url not null
  static Future<ParsedData> _downloadAndParsingData(ComputeParam param) async {
    try {
      final downloadAndParsingJsonUC = DownloadAndParsingJsonUseCase();
      final countries = <Country>[];
      final cities = <City>[];
      final states = <State>[];

      if (param.countryUrl != null) {
        countries.addAll(await downloadAndParsingJsonUC.execute<Country>(
            param.countryUrl!, (json) => Country.fromJson(json)));
      }

      if (param.cityUrl != null) {
        cities.addAll(await downloadAndParsingJsonUC.execute<City>(
            param.cityUrl!, (json) => City.fromJson(json)));
      }

      if (param.stateUrl != null) {
        states.addAll(await downloadAndParsingJsonUC.execute<State>(
            param.stateUrl!, (json) => State.fromJson(json)));
      }

      return (
        countries: countries,
        cities: cities,
        states: states
      );
    } catch (e) {
      return Future.error(e);
    }
  }

  void _handleParsingData(ParsedData parsingData) {
    // Save json data to session
    if (parsingData.countries.isNotEmpty) {
      _countries.clear();
      _countries.addAll(parsingData.countries);
    }

    if (parsingData.cities.isNotEmpty) {
      _cities.clear();
      _cities.addAll(parsingData.cities);
    }

    if (parsingData.states.isNotEmpty) {
      _states.clear();
      _states.addAll(parsingData.states);
    }

    _saveDb();
  }

  Future<void> _saveDb() async {
    // save sync time
    final now = DateTime.now().toUtc().millisecondsSinceEpoch;
    final firstTimeSync = _localSyncDate == null;

    if (firstTimeSync || _shouldUpdateCountries) {
      log('country change');
      await deleteCollectionUC.execute<Country>();
      await saveCollectionUC.execute<Country>(list: _countries);
    }

    if (firstTimeSync || _shouldUpdateCities) {
      log('city change');
      await deleteCollectionUC.execute<City>();
      await saveCollectionUC.execute<City>(list: _cities);
    }

    if (firstTimeSync || _shouldUpdateStates) {
      log('state change');
      await deleteCollectionUC.execute<State>();
      await saveCollectionUC.execute<State>(list: _states);
    }

    if (firstTimeSync || _shouldUpdateRaces) {
      log('race change');
      await deleteCollectionUC.execute<Race>();
      await saveCollectionUC.execute<Race>(list: _races);
    }

    if (firstTimeSync || _shouldUpdateParamType) {
      log('param type change');
      await deleteCollectionUC.execute<ParamType>();
      await saveCollectionUC.execute<ParamType>(list: _paramTypes);
    }

    if (firstTimeSync || _shouldUpdateSystemParam) {
      log('system param change');
      await deleteCollectionUC.execute<SystemParam>();
      await saveCollectionUC.execute<SystemParam>(object: _systemParam);
    }

    if (firstTimeSync || _shouldUpdateRoles) {
      log('roles change');
      await deleteCollectionUC.execute<Role>();
      await saveCollectionUC.execute<Role>(list: _roles);
    }

    await deleteCollectionUC.execute<TableSyncDate>();
    await saveCollectionUC.execute<TableSyncDate>(object: _firebaseSyncDate);
    // notify listener
    final appEventChannel = AppEventChannel();
    appEventChannel.addEvent(FinishSyncData(true));
  }

  Future<void> _loadDbToSession() async {
    log('------LOAD DB-------');
    final countries = await loadCollectionUC.execute<Country>();
    final cities = await loadCollectionUC.execute<City>();
    final states = await loadCollectionUC.execute<State>();
    final races = await loadCollectionUC.execute<Race>();
    final paramTypes = await loadCollectionUC.execute<ParamType>();
    final systemParam = await loadCollectionUC.execute<SystemParam>();
    final roles = await loadCollectionUC.execute<Role>();
    _countries.addAll(countries);
    _cities.addAll(cities);
    _states.addAll(states);
    _races.addAll(races);
    _paramTypes.addAll(paramTypes);
    _roles.addAll(roles);
    _systemParam = systemParam.first;
  }

  // return new list to avoid modify
  List<Country> get countries => _countries.toList();
  List<City> get cities => _cities.toList();
  List<State> get states => _states.toList();
  List<Race> get races => _races.toList();
  List<Role> get roles => _roles.toList();
  String get trialTime => _systemParam.trialTime.toString();
  String get termUrl => _systemParam.systemUrlTerms.toString();
  String get privacyUrl => _systemParam.systemUrlPrivacyPolicy.toString();
  List<ParamType> get paramType => _paramTypes.toList();
  bool get _shouldUpdateParamType => (_firebaseSyncDate?.paramType ?? 0) > (_localSyncDate?.paramType ?? 0);
  bool get _shouldUpdateRaces => (_firebaseSyncDate?.race ?? 0) > (_localSyncDate?.race ?? 0);
  bool get _shouldUpdateSystemParam => (_firebaseSyncDate?.systemParam ?? 0) > (_localSyncDate?.systemParam ?? 0);
  bool get _shouldUpdateCountries => (_firebaseSyncDate?.country ?? 0) > (_localSyncDate?.country ?? 0);
  bool get _shouldUpdateCities => (_firebaseSyncDate?.city ?? 0) > (_localSyncDate?.city ?? 0);
  bool get _shouldUpdateStates => (_firebaseSyncDate?.state ?? 0) > (_localSyncDate?.state ?? 0);
  bool get _shouldUpdateRoles => (_firebaseSyncDate?.role ?? 0) > (_localSyncDate?.role ?? 0);
}
