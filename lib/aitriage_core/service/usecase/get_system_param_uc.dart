import 'package:flutter_aitriage/aitriage_core/service/entity/race.dart';
import 'package:flutter_aitriage/aitriage_core/service/entity/system_param.dart';
import '../service/api_service/repository/get_system_param_repository.dart';
import '../service/api_service/response/get_system_param_response.dart';
import '../service/local_storage_service/database/repository/isar_database_repository.dart';

class GetAppParamUseCase {
  final _repository = GetSystemParamRepository();

  Future<AppParam> execute() async {
    final systemParamResp = await _repository.getSystemParam();
    final raceResp = await _repository.getRace();
    final countryFileUrl = systemParamResp.data.systemPathFileCountries;
    final cityFileUrl = systemParamResp.data.systemPathFileCity;
    final stateFileUrl = systemParamResp.data.systemPathFileStates;
    final appParam = AppParam(
        countryFileUrl ?? '',
        cityFileUrl ?? '',
        stateFileUrl ?? '',
        systemParamResp.data.trialTime ?? '',
        raceResp.data
    );

    return appParam;
  }
}

class AppParam {
  final String countryFileUrl;
  final String cityFileUrl;
  final String stateFileUrl;
  final String trialTime;
  final List<Race> race;

  AppParam(
      this.countryFileUrl,
      this.cityFileUrl,
      this.stateFileUrl,
      this.trialTime,
      this.race
  );
}