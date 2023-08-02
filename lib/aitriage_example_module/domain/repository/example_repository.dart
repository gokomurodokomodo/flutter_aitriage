import '../../data/api/request/example_request.dart';
import '../../data/api/response/example_response.dart';

abstract class ExampleRepository {
  Future<ExampleResponse> doSomething(ExampleRequest request);
}