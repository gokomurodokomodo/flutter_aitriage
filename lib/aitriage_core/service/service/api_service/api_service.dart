import 'package:flutter/foundation.dart';
import 'package:flutter_aitriage/aitriage_core/service/entity/city.dart';
import 'package:flutter_aitriage/aitriage_core/service/entity/country.dart';
import 'package:flutter_aitriage/aitriage_core/service/entity/race.dart';
import 'package:flutter_aitriage/aitriage_core/service/usecase/download_and_parsing_city_json_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/usecase/download_and_parsing_country_json_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/usecase/get_table_sync_date_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/usecase/save_database_data_uc.dart';
import 'package:get/get.dart';
import '../../../network/handle_error/handle_error.dart';
import '../../../network/provider/firebase_provider.dart';
import '../../../util/global_function.dart';
import '../../entity/state.dart';
import '../../entity/table_sync_date.dart';
import '../../usecase/download_and_parsing_state_json_uc.dart';
import '../../usecase/get_param_type_uc.dart';
import '../../usecase/get_system_param_uc.dart';
import '../../usecase/get_user_info_uc.dart';

class ApiService extends GetxService {
  // UseCase
  final getAppParamUseCase = GetAppParamUseCase();
  final getUserInfoUseCase = GetUserInfoUseCase();
  final getParamTypeUseCase = GetParamTypeUseCase();
  final getTableSyncDateUseCase = GetTableSyncDateUseCase();
  final downloadAndParsingCountryJsonUseCase = DownloadAndParsingCountryJson();
  final downloadAndParsingCityJsonUseCase = DownloadAndParsingCityJsonUseCase();
  final downloadAndParsingStateJsonUseCase = DownloadAndParsingStateJsonUseCase();

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
      final timeSyncData = await getTableSyncDateUseCase.execute();
      final resp = await getAppParamUseCase.execute();
      _trialTime = resp.trialTime;
      _termUrl = resp.termURL;
      _privacyUrl = resp.privacyUrl;
      _listRace.addAll(resp.race);

      if (timeSyncData == null) {
        // run in another thread
        compute((argument) async {
          final country = await DownloadAndParsingCountryJson()
              .execute(argument[0].toString());
          final city = await DownloadAndParsingCityJsonUseCase()
              .execute(argument[1].toString());
          final state = await DownloadAndParsingStateJsonUseCase()
              .execute(argument[2].toString());

          return {'country': country, 'city': city, 'state': state};
        }, [resp.countryFileUrl, resp.cityFileUrl, resp.stateFileUrl])
            .then((value) {
          _listCountry.addAll(value['country'] as List<Country>);
          _listCity.addAll(value['city'] as List<City>);
          _listState.addAll(value['state'] as List<State>);
          _saveToDb();
        });
      } else {
        // load db
      }
    } catch (e) {
      HandleNetworkError.handleNetworkError(
          e, (message, _, __) => Get.snackbar('Error', message));
    }
  }

  Future<void> getParamType() async {
    try {
      final resp = await getParamTypeUseCase.execute();
      paramTypes.addAll(resp.data);
    } catch (e) {
      HandleNetworkError.handleNetworkError(
          e, (message, _, __) => Get.snackbar('Error', message));
    }
  }

  void _saveToDb() async {
    await SaveDatabaseDataUseCase<Country>().execute(list: _listCountry);
    await SaveDatabaseDataUseCase<City>().execute(list: _listCity);
    await SaveDatabaseDataUseCase<State>().execute(list: _listState);
    await SaveDatabaseDataUseCase<Race>().execute(list: _listRace);
    // save sync time
    final now = DateTime.now().toUtc().millisecondsSinceEpoch;
    final time = TableSyncDate.setAll(now);
    await SaveDatabaseDataUseCase<TableSyncDate>().execute(object: time);
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
