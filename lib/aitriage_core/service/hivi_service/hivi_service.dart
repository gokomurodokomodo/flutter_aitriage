import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_aitriage/aitriage_core/entity/system_param.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/use_case/download_and_parsing_json_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/use_case/get_system_param_uc.dart';
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
  final _listCountry = <Country>[];
  final _listCity = <City>[];
  final _listState = <State>[];
  final _listRace = <Race>[];
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
        _listRace.addAll(appParam.races);
        _paramTypes.addAll(appParam.paramTypes);
        compute(_downloadAndParsingData, appParam).then((result) => _handleParsingData(result));
      } else {
        _loadDb();
      }

      // onSuccess?.call();
    } catch (e) {
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
    _listCountry.addAll(list[0] as List<Country>);
    _listCity.addAll(list[1] as List<City>);
    _listState.addAll(list[2] as List<State>);
    _saveDb();
  }

  void _saveDb() async {
    // save sync time
    final now = DateTime.now().toUtc().millisecondsSinceEpoch;
    final tableSyncDate = TableSyncDate.setAll(now);
    await saveCollectionUC.execute<Country>(list: _listCountry);
    await saveCollectionUC.execute<City>(list: _listCity);
    await saveCollectionUC.execute<State>(list: _listState);
    await saveCollectionUC.execute<Race>(list: _listRace);
    await saveCollectionUC.execute<ParamType>(list: _paramTypes);
    await saveCollectionUC.execute<SystemParam>(object: _systemParam);
    await saveCollectionUC.execute<TableSyncDate>(object: tableSyncDate);
    // notify listener
    final appEventChannel = AppEventChannel();
    appEventChannel.addEvent(FinishSyncData(true));
  }

  void _loadDb() async {
    log('------LOAD DB-------');
    final countries = await loadCollectionUC.execute<Country>();
    final cities = await loadCollectionUC.execute<City>();
    final states = await loadCollectionUC.execute<State>();
    final races = await loadCollectionUC.execute<Race>();
    final paramTypes = await loadCollectionUC.execute<ParamType>();
    final systemParam = await loadCollectionUC.execute<SystemParam>();
    _listCountry.addAll(countries);
    _listCity.addAll(cities);
    _listState.addAll(states);
    _listRace.addAll(races);
    _paramTypes.addAll(paramTypes);
    _systemParam = systemParam.first;
  }

  // return new list to avoid modify
  List<Country> get listCountry => _listCountry.toList();

  List<City> get listCity => _listCity.toList();

  List<State> get listState => _listState.toList();

  List<Race> get listRace => _listRace.toList();

  String get trialTime => _systemParam.trialTime.toString();

  String get termUrl => _systemParam.systemUrlTerms.toString();

  String get privacyUrl => _systemParam.systemUrlPrivacyPolicy.toString();

  List<ParamType> get paramType => _paramTypes.toList();
}
