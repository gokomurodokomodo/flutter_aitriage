import 'package:flutter_aitriage/aitriage_example_module/config/example_module_api_route.dart';
import 'package:flutter_aitriage/aitriage_example_module/config/example_module_dio_provider_impl.dart';
import 'package:flutter_aitriage/aitriage_example_module/config/example_module_getx_provider_impl.dart';
import 'package:flutter_aitriage/aitriage_example_module/data/api/request/example_request.dart';
import 'package:flutter_aitriage/aitriage_example_module/data/api/response/example_response.dart';
import 'package:flutter_aitriage/aitriage_example_module/domain/repository/example_repository.dart';

class ExampleRepositoryImpl implements ExampleRepository {
  final dioProvider = ExampleModuleDioProviderImpl();
  final getConnectProvider = ExampleModuleGetXProviderImpl();

  @override
  Future<ExampleResponse> doSomething(ExampleRequest request) async {
    final resp = await getConnectProvider.get(ExampleModuleApiRoute.login, query: {'q': 'Laptop'});
    return getConnectProvider.convertResponse(resp, (json) => ExampleResponse.fromJson(json));
  }
}

