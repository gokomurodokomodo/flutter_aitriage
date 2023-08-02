import '../../aitriage_core/common/app_env.dart';
import '../../aitriage_core/network/provider/get_base_provider.dart';

//nếu không truyền tham số sẽ ăn theo cấu hình chung
class ExampleModuleGetXProviderImpl extends GetConnectBaseProvider {
  ExampleModuleGetXProviderImpl({String? url, String? apiPrefix, String? apiVersion})
      : super(
      url: url ?? AppEnvironment.baseUrl,
      apiPrefix: apiPrefix ?? '',
      apiVersion: apiVersion ?? AppEnvironment.apiVersion);
}