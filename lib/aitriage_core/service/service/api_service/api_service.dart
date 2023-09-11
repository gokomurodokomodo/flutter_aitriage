import 'package:flutter_aitriage/aitriage_core/service/entity/city.dart';
import 'package:flutter_aitriage/aitriage_core/service/entity/country.dart';
import 'package:flutter_aitriage/aitriage_core/service/entity/race.dart';
import 'package:flutter_aitriage/aitriage_core/service/usecase/download_and_parsing_city_json_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/usecase/download_and_parsing_country_json_uc.dart';
import 'package:get/get.dart';
import '../../../network/handle_error/handle_error.dart';
import '../../../util/global_function.dart';
import '../../entity/state.dart';
import '../../usecase/download_and_parsing_state_json_uc.dart';
import '../../usecase/get_param_type_uc.dart';
import '../../usecase/get_system_param_uc.dart';
import '../../usecase/get_user_info_uc.dart';

class ApiService extends GetxService {
  // UseCase
  final getAppParamUseCase = GetAppParamUseCase();
  final getUserInfoUseCase = GetUserInfoUseCase();
  final getParamTypeUseCase = GetParamTypeUseCase();
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

  @override
  void onInit() async{
    super.onInit();
    await _getParamType();
  }

  // country, city, state are json file, need parsing
  // race
  Future<void> getAppParam() async {
    try {
      final resp = await getAppParamUseCase.execute();
      _listCountry.addAll(await downloadAndParsingCountryJsonUseCase.execute(resp.countryFileUrl));
      _listCity.addAll(await downloadAndParsingCityJsonUseCase.execute(resp.cityFileUrl));
      _listState.addAll(await downloadAndParsingStateJsonUseCase.execute(resp.stateFileUrl));
      _listRace.addAll(resp.race);
      _trialTime = resp.trialTime;
      _termUrl = resp.termURL;
      _privacyUrl = resp.privacyUrl;
    } catch (e) {
      print(e);
      HandleNetworkError.handleNetworkError(e, (message, _, __) => Get.snackbar('Error', message));
    }
  }

  Future<void> _getParamType() async {
    try {
      final resp = await getParamTypeUseCase.execute();
      paramTypes.addAll(resp.data);
    } catch (e) {
      HandleNetworkError.handleNetworkError(e, (message, _, __) => Get.snackbar('Error', message));
    }
  }

  // return new list to avoid modify
  List<Country> get listCountry => _listCountry.toList();
  List<City> get listCity => _listCity.toList();
  List<State> get listState => _listState.toList();
  List<Race> get listRace => _listRace.toList();
  String get trialTime => _trialTime.toString();
  String get termUrl => _termUrl;
  String get privacyUrl => _privacyUrl;
}