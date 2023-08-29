import 'package:flutter_aitriage/aitriage_module_auth/config/auth_module_api_route.dart';
import 'package:flutter_aitriage/aitriage_module_auth/config/auth_module_getx_provider_impl.dart';
import 'package:flutter_aitriage/aitriage_module_auth/data/api/request/generate_code_request.dart';
import 'package:flutter_aitriage/aitriage_module_auth/data/api/request/register_request.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/repository/sign_up_repository.dart';
import '../../../aitriage_core/network/base_response.dart';
import '../../../aitriage_core/util/device_info/device_info.dart';

class SignUpRepositoryImpl extends SignUpRepository {
  final getConnectProvider = ModuleAuthGetXProviderImpl();

  @override
  Future<BaseResponse> generateCodeEmail2Fa(GenerateCodeRequest request) async {
    final resp = await getConnectProvider.post(AuthModuleApiRoute.generateCode, request.toRequest());
    return getConnectProvider.convertResponse(resp, (json) => BaseResponse.fromJson(json));
  }

  @override
  Future<BaseResponse> register(RegisterRequest request) async {
    final deviceInfo = await DeviceInfoUtils().getHeader();
    final resp = await getConnectProvider.post(AuthModuleApiRoute.register, request.toRequest(), headers: {'Device': deviceInfo.toHeaderJson()});
    return getConnectProvider.convertResponse(resp, (json) => BaseResponse.fromJson(json));
  }
}