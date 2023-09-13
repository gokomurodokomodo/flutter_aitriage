import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/usecase/download_and_parsing_json_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/usecase/get_param_type_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/usecase/get_system_param_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/usecase/get_table_sync_date_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/usecase/get_user_info_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/usecase/load_collection_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/usecase/save_collection_uc.dart';
import 'package:flutter_aitriage/aitriage_core/util/app_event_channel/core/app_event_channel.dart';
import 'package:flutter_aitriage/aitriage_core/util/app_event_channel/custom_event/finish_sync_data.dart';
import 'package:get/get.dart';
import '../../entity/city.dart';
import '../../entity/country.dart';
import '../../entity/race.dart';
import '../../entity/state.dart';
import '../../entity/table_sync_date.dart';
import '../../util/global_function.dart';

class HiviService extends GetxService {
  // UseCase
  final getAppParamUC = GetAppParamUseCase();
  final getUserInfoUC = GetUserInfoUseCase();
  final getParamTypeUC = GetParamTypeUseCase();
  final getTableSyncDateUC = GetTableSyncDateUseCase();
  final saveCollectionUC = SaveCollectionUseCase();
  final loadCollectionUC = LoadCollectionUseCase();
  // Data
  final _listCountry = <Country>[];
  final _listCity = <City>[];
  final _listState = <State>[];
  final _listRace = <Race>[];
  var _trialTime = '';
  var _termUrl = '';
  var _privacyUrl = '';

  // country, city, state are json file, need parsing
  // race
  Future<void> getAppParam() async {
    try {
      final timeSyncData = await getTableSyncDateUC.execute();
      final param = await getAppParamUC.execute();
      _saveInSession(param);
      timeSyncData == null
          ? compute(_downloadAndParsingData, param).then((result) => _handleParsingData(result))
          : _loadDb();
    } catch (e) {
      // HandleNetworkError.handleNetworkError(
      //     e, (message, _, __) => Get.snackbar('Error', message));
    }
  }

  void _saveInSession(AppParam param) {
    _trialTime = param.trialTime;
    _termUrl = param.termURL;
    _privacyUrl = param.privacyUrl;
    _listRace.addAll(param.race);
  }

  // MUST BE STATIC OR GLOBAL FUNCTION OR ELSE GETTING POINTER ERROR IN ISOLATE
  static Future<List<dynamic>> _downloadAndParsingData(AppParam param) async {
    try {
      final downloadAndParsingJsonUC = DownloadAndParsingJsonUseCase();
      final countries = await downloadAndParsingJsonUC
          .execute<Country>(param.countryFileUrl, (json) => Country.fromJson(json));
      final cities = await downloadAndParsingJsonUC
          .execute<City>(param.cityFileUrl, (json) => City.fromJson(json));
      final states = await downloadAndParsingJsonUC
          .execute<State>(param.stateFileUrl, (json) => State.fromJson(json));
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
    await saveCollectionUC.execute<TableSyncDate>(object: tableSyncDate);
    // notify listener
    final appEventChannel = AppEventChannel();
    appEventChannel.addEvent(FinishSyncData(true));
  }

  void _loadDb() async {
    final countries = await loadCollectionUC.execute<Country>();
    final cities = await loadCollectionUC.execute<City>();
    final states = await loadCollectionUC.execute<State>();
    _listCountry.addAll(countries);
    _listCity.addAll(cities);
    _listState.addAll(states);
    log('------LOAD DB-------');
  }

  Future<void> getParamType() async {
    try {
      final resp = await getParamTypeUC.execute();
      paramTypes.addAll(resp.data);
    } catch (e) {
      // HandleNetworkError.handleNetworkError(
      //     e, (message, _, __) => Get.snackbar('Error', message));
    }
  }

  // return new list to avoid modify
  List<Country> get listCountry => _listCountry.toList();

  List<City> get listCity => _listCity.toList();

  List<State> get listState => _listState.toList();

  List<Race> get listRace => _listRace.toList();

  String get trialTime => _trialTime.toString();

  String get termUrl => _termUrl.toString();

  String get privacyUrl => _privacyUrl.toString();
}
