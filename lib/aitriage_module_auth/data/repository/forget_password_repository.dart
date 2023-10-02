import 'package:flutter_aitriage/aitriage_module_auth/data/api/query/forget_password_query.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/repository/forget_password_repository.dart';
import '../../../aitriage_core/network/common/base_response.dart';
import '../../config/auth_module_api_route.dart';
import '../../config/auth_module_getx_provider_impl.dart';

class ForgetPasswordRepositoryImpl extends ForgetPasswordRepository {
  final _provider = ModuleAuthGetXProviderImpl();

  @override
  Future<BaseResponse> sendPasswordResetVerifiedCode(ForgetPasswordQuery query) async {
    // Pass empty body
    final resp = await _provider.post(AuthModuleApiRoute.forgetPassword, {}, query: query.toQuery);
    return _provider.convertResponse(resp, (json) => BaseResponse.fromJson(json));
  }
}