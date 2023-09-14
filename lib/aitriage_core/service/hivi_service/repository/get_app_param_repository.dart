import '../../../common/app_env.dart';
import '../../../network/provider/get_base_provider.dart';
import '../config/hivi_service_api_route.dart';
import '../response/get_param_type_response.dart';
import '../response/get_race_response.dart';
import '../response/get_role_response.dart';
import '../response/get_system_param_response.dart';

class GetAppParamRepository {
  final _provider = GetConnectBaseProvider(url: AppEnvironment.baseUrl);

  // system param includes list country, city, state
  Future<GetSystemParamResponse> getSystemParam() async {
    final resp = await _provider.get(HiviServiceApiRoute.getSystemParam);
    return _provider.convertResponse(resp, (json) => GetSystemParamResponse.fromJson(json));
  }

  Future<GetParamTypeResponse> getParamType() async {
    final resp = await _provider.get(HiviServiceApiRoute.getParamType);
    return _provider.convertResponse(resp, (json) => GetParamTypeResponse.fromJson(json));
  }

  Future<GetRaceResponse> getRace() async {
    final resp = await _provider.get(HiviServiceApiRoute.getRace);
    return _provider.convertResponse(resp, (json) => GetRaceResponse.fromJson(json));
  }

  Future<GetRoleResponse> getRole() async {
    final resp = await _provider.get(HiviServiceApiRoute.getRole);
    return _provider.convertResponse(resp, (json) => GetRoleResponse.fromJson(json));
  }
}