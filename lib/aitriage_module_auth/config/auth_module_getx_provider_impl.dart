import 'package:flutter_aitriage/aitriage_module_auth/config/auth_module_api_route.dart';
import '../../aitriage_core/common/app_env.dart';
import '../../aitriage_core/network/provider/get_base_provider.dart';

class ModuleAuthGetXProviderImpl extends GetConnectBaseProvider {
  ModuleAuthGetXProviderImpl()
      : super(
          url: AppEnvironment.baseUrl,
          apiPrefix: AuthModuleApiRoute.apiPrefix,
          apiVersion: AppEnvironment.apiVersion);
}