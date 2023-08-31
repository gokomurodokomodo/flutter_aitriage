import 'package:flutter_aitriage/aitriage_core/service/api_service/get_system_param/get_system_param_response.dart';

import '../../../common/app_env.dart';
import '../../../network/provider/get_base_provider.dart';
import '../api_service_route.dart';

class GetSystemParamRepository {
  final _provider = GetConnectBaseProvider(url: AppEnvironment.baseUrl);

  Future<GetSystemParamResponse> getSystemParam() async {
    final resp = await _provider.get(ApiServiceRoute.getSystemParam);
    return _provider.convertResponse(resp, (json) => GetSystemParamResponse.fromJson(json));
  }
}