import '../../../../common/app_env.dart';
import '../../../../network/provider/get_base_provider.dart';
import '../api_service_route.dart';
import '../response/get_param_type_response.dart';
import '../response/get_race_response.dart';
import '../response/get_system_param_response.dart';

class GetSystemParamRepository {
  final _provider = GetConnectBaseProvider(url: AppEnvironment.baseUrl);

  // system param includes list country, city, state
  Future<GetSystemParamResponse> getSystemParam() async {
    final resp = await _provider.get(ApiServiceRoute.getSystemParam);
    return _provider.convertResponse(resp, (json) => GetSystemParamResponse.fromJson(json));
  }

  Future<GetParamTypeResponse> getParamType() async {
    final resp = await _provider.get(ApiServiceRoute.getParamType);
    return _provider.convertResponse(resp, (json) => GetParamTypeResponse.fromJson(json));
  }

  Future<GetRaceResponse> getRace() async {
    final resp = await _provider.get(ApiServiceRoute.getRace);
    return _provider.convertResponse(resp, (json) => GetRaceResponse.fromJson(json));
  }
}