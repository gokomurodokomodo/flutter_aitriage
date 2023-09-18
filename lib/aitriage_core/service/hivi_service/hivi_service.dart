import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_aitriage/aitriage_core/entity/system_param.dart';
import 'package:flutter_aitriage/aitriage_core/entity/user_info.dart';
import 'package:flutter_aitriage/aitriage_core/local_storage/flutter_secured_storage/repository/active_user_repository.dart';
import 'package:flutter_aitriage/aitriage_core/local_storage/flutter_secured_storage/response/active_user_info_enum.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/use_case/download_and_parsing_json_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/use_case/get_app_param_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/use_case/get_table_sync_date_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/use_case/get_user_info_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/use_case/load_collection_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/use_case/save_collection_uc.dart';
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

class HiviService extends GetxService {
  // UseCase
  final getAppParamUC = GetAppParamUseCase();
  final getUserInfoUC = GetUserInfoUseCase();
  final getTableSyncDateUC = GetTableSyncDateUseCase();
  final saveCollectionUC = SaveCollectionUseCase();
  final loadCollectionUC = LoadCollectionUseCase();
  // Data
  final _countries = <Country>[];
  final _cities = <City>[];
  final _states = <State>[];
  final _races = <Race>[];
  final _roles = <Role>[];
  final _paramTypes = <ParamType>[];
  late SystemParam _systemParam;

  // country, city, state are json file, need parsing
  // race
  Future<void> getAppParam({
    Function? onSuccess,
    Function(dynamic)? onError
  }) async {
    try {
      final timeSyncData = await getTableSyncDateUC.execute();

      if (timeSyncData == null) {
        final appParam = await getAppParamUC.execute();
        _systemParam = appParam.systemParam;
        _races.addAll(appParam.races);
        _paramTypes.addAll(appParam.paramTypes);
        // _roles.addAll(appParam.roles);
        compute(_downloadAndParsingData, appParam).then((result) => _handleParsingData(result));
      } else {
        await _loadDb();
      }

      // onSuccess?.call();
    } catch (e) {
      print(e.toString());
      onError?.call(e);
    }
  }

  // MUST BE STATIC OR GLOBAL FUNCTION OR ELSE GETTING POINTER ERROR IN ISOLATE
  static Future<List<dynamic>> _downloadAndParsingData(AppParam param) async {
    try {
      final downloadAndParsingJsonUC = DownloadAndParsingJsonUseCase();
      final countries = await downloadAndParsingJsonUC
          .execute<Country>(param.systemParam.systemPathFileCountries ?? '', (json) => Country.fromJson(json));
      final cities = await downloadAndParsingJsonUC
          .execute<City>(param.systemParam.systemPathFileCity ?? '', (json) => City.fromJson(json));
      final states = await downloadAndParsingJsonUC
          .execute<State>(param.systemParam.systemPathFileStates ?? '', (json) => State.fromJson(json));
      return [countries, cities, states];
    } catch (e) {
      return Future.error(e);
    }
  }

  void _handleParsingData(List<dynamic> list) {
    // must the same order in _downloadAndParsingData returning value
    _countries.addAll(list[0] as List<Country>);
    _cities.addAll(list[1] as List<City>);
    _states.addAll(list[2] as List<State>);
    _saveDb();
  }

  void _saveDb() async {
    // save sync time
    final now = DateTime.now().toUtc().millisecondsSinceEpoch;
    final tableSyncDate = TableSyncDate.setAll(now);
    await saveCollectionUC.execute<Country>(list: _countries);
    await saveCollectionUC.execute<City>(list: _cities);
    await saveCollectionUC.execute<State>(list: _states);
    await saveCollectionUC.execute<Race>(list: _races);
    await saveCollectionUC.execute<ParamType>(list: _paramTypes);
    await saveCollectionUC.execute<SystemParam>(object: _systemParam);
    await saveCollectionUC.execute<Role>(list: _roles);
    await saveCollectionUC.execute<TableSyncDate>(object: tableSyncDate);
    // notify listener
    final appEventChannel = AppEventChannel();
    appEventChannel.addEvent(FinishSyncData(true));
  }

  Future<void> _loadDb() async {
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

  Future<UserInfo> getOfflineUserInfo(String userKey) async{
    return await ActiveUserInformationUseCase.userInfo.getData();
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
}
