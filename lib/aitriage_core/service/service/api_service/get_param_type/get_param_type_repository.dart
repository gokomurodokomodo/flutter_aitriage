import '../../../../common/app_env.dart';
import '../../../../network/provider/get_base_provider.dart';
import '../api_service_route.dart';
import 'get_param_type_response.dart';

class GetParamTypeRepository {
  final _provider = GetConnectBaseProvider(url: AppEnvironment.baseUrl);

  Future<GetParamTypeResponse> getParamType() async {
    final resp = await _provider.get(ApiServiceRoute.getParamType);
    return _provider.convertResponse(resp, (json) => GetParamTypeResponse.fromJson(json));
  }
}