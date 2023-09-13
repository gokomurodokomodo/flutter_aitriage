import '../../../entity/race.dart';
import '../repository/get_system_param_repository.dart';

class GetAppParamUseCase {
  final _repository = GetSystemParamRepository();

  Future<AppParam> execute() async {
    final systemParamResp = await _repository.getSystemParam();
    final raceResp = await _repository.getRace();
    final countryFileUrl = systemParamResp.data.systemPathFileCountries;
    final cityFileUrl = systemParamResp.data.systemPathFileCity;
    final stateFileUrl = systemParamResp.data.systemPathFileStates;
    final privacyUrl = systemParamResp.data.systemUrlPrivacyPolicy;
    final termUrl = systemParamResp.data.systemUrlTerms;
    final appParam = AppParam(
        countryFileUrl ?? '',
        cityFileUrl ?? '',
        stateFileUrl ?? '',
        systemParamResp.data.trialTime ?? '',
        raceResp.data,
        termUrl ?? '',
        privacyUrl ?? ''
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
  final String termURL;
  final String privacyUrl;

  AppParam(
      this.countryFileUrl,
      this.cityFileUrl,
      this.stateFileUrl,
      this.trialTime,
      this.race,
      this.termURL,
      this.privacyUrl
  );
}