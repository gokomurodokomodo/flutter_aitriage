import '../../aitriage_core/common/app_env.dart';
import '../../aitriage_core/network/provider/dio_base_provider.dart';

class ExampleModuleDioProviderImpl extends DioBaseProvider {
  ExampleModuleDioProviderImpl({String? url, String? apiPrefix, String? apiVersion})
      : super(
      url: url ?? AppEnvironment.baseUrl,
      apiPrefix: apiPrefix ?? '',
      apiVersion: apiVersion ?? AppEnvironment.apiVersion);
}