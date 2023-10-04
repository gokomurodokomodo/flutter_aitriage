import 'package:flutter_aitriage/aitriage_core/network/common/base_response.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/repository/sign_out_repository.dart';
import '../../config/auth_module_api_route.dart';
import '../../config/auth_module_getx_provider_impl.dart';

class SignOutRepositoryImpl extends SignOutRepository {
  final _provider = ModuleAuthGetXProviderImpl();

  @override
  Future<BaseResponse> signOut(String userId, String accessToken) async {
    final resp = await _provider.post(AuthModuleApiRoute.logOut.replaceAll('%s', userId), {}, headers: {'accessToken': accessToken});
    return _provider.convertResponse(resp, (json) => BaseResponse.fromJson(json));
  }
}