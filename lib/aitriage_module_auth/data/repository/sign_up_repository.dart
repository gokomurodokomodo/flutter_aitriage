import 'package:flutter_aitriage/aitriage_core/common/app_env.dart';
import 'package:flutter_aitriage/aitriage_core/network/provider/get_base_provider.dart';
import 'package:flutter_aitriage/aitriage_module_auth/config/auth_module_api_route.dart';
import 'package:flutter_aitriage/aitriage_module_auth/config/auth_module_getx_provider_impl.dart';
import 'package:flutter_aitriage/aitriage_module_auth/data/api/query/register_account_query.dart';
import 'package:flutter_aitriage/aitriage_module_auth/data/api/request/generate_code_request.dart';
import 'package:flutter_aitriage/aitriage_module_auth/data/api/request/register_request.dart';
import 'package:flutter_aitriage/aitriage_module_auth/data/api/request/verify_email_request.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/repository/sign_up_repository.dart';
import '../../../aitriage_core/network/base_response.dart';
import '../../../aitriage_core/util/device_info/device_info.dart';
import '../api/response/register_account_param_response.dart';

class SignUpRepositoryImpl extends SignUpRepository {
  final _authProvider = ModuleAuthGetXProviderImpl();
  final _paramProvider = GetConnectBaseProvider(
      url: AppEnvironment.baseUrl, 
      apiPrefix: '/setting', 
      apiVersion: AppEnvironment.apiVersion
  );

  @override
  Future<BaseResponse> generateCodeEmail2Fa(GenerateCodeRequest request) async {
    final resp = await _authProvider.post(AuthModuleApiRoute.generateCode, request.toRequest());
    return _authProvider.convertResponse(resp, (json) => BaseResponse.fromJson(json));
  }

  @override
  Future<BaseResponse> register(RegisterRequest request) async {
    final deviceInfo = await DeviceInfoUtils().getHeader();
    final resp = await _authProvider.post(AuthModuleApiRoute.register, request.toRequest(), headers: {'Device': deviceInfo.toHeaderJson()});
    return _authProvider.convertResponse(resp, (json) => BaseResponse.fromJson(json));
  }

  @override
  Future<RegisterAccountParamResponse> getRegisterAccountParam(RegisterAccountQuery query) async {
    final resp = await _paramProvider.get(AuthModuleApiRoute.getRegisterAccountParam, query: query.toQuery);
    return _paramProvider.convertResponse(resp, (json) => RegisterAccountParamResponse.fromJson(json));
  }

  @override
  Future<BaseResponse> verifyEmail(VerifyEmailRequest request) async {
    final resp = await _authProvider.post(AuthModuleApiRoute.verifyEmail, request.toRequest());
    return _authProvider.convertResponse(resp, (json) => BaseResponse.fromJson(json));
  }
}