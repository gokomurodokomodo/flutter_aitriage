import 'package:flutter_aitriage/aitriage_module_auth/config/auth_module_api_route.dart';
import 'package:flutter_aitriage/aitriage_module_auth/config/auth_module_getx_provider_impl.dart';
import 'package:flutter_aitriage/aitriage_module_auth/data/api/response/register_account_response.dart';
import 'package:flutter_aitriage/aitriage_module_auth/data/api/request/register.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/repository/sign_up_repository.dart';

import '../../../aitriage_core/util/device_info/device_info.dart';

class SignUpRepositoryImpl extends SignUpRepository {
  final getConnectProvider = ModuleAuthGetXProviderImpl();

  @override
  generateCodeEmail2Fa() {
    // TODO: implement generateCodeEmail2Fa
    throw UnimplementedError();
  }

  @override
  Future<RegisterAccountResponse> register(RegisterRequest request) async {
    final deviceInfo = await DeviceInfoUtils().getHeader();
    final resp = await getConnectProvider.post(AuthModuleApiRoute.register, request.toRequest(), headers: {'Device': deviceInfo.toHeaderJson()});
    return getConnectProvider.convertResponse(resp, (json) => RegisterAccountResponse.fromJson(json));
  }
}