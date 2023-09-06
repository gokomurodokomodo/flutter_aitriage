import 'package:flutter_aitriage/aitriage_core/network/common/base_response.dart';
import 'package:flutter_aitriage/aitriage_module_auth/config/auth_module_api_route.dart';
import 'package:flutter_aitriage/aitriage_module_auth/data/api/request/sign_in_request.dart';
import 'package:flutter_aitriage/aitriage_module_auth/data/api/request/verify_login_request.dart';
import 'package:flutter_aitriage/aitriage_module_auth/data/api/response/user_param_response.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/repository/sign_in_repository.dart';
import '../../../aitriage_core/util/device_info/device_info.dart';
import '../../config/auth_module_getx_provider_impl.dart';

class SignInRepositoryImpl extends SignInRepository{
  final _authProvider = ModuleAuthGetXProviderImpl();

  @override
  Future<UserParamResponse> signIn(SignInRequest signInRequest) async{
    final deviceInfo = await DeviceInfoUtils().getHeader();
    final response = await _authProvider.post(AuthModuleApiRoute.signIn, signInRequest.toRequest(), headers: {'Device': deviceInfo.toHeaderJson()});
    return _authProvider.convertResponse(response, (json) => UserParamResponse.fromJson(json));
  }

  @override
  Future<UserParamResponse> signInWithCode(VerifyLoginRequest request) async{
    final deviceInfo = await DeviceInfoUtils().getHeader();
    final response = await _authProvider.post(AuthModuleApiRoute.signIn, request.toRequest(), headers: {'Device': deviceInfo.toHeaderJson()});
    return _authProvider.convertResponse(response, (json) => UserParamResponse.fromJson(json));

  }
}