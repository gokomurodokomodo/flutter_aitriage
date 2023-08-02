import 'dart:async';
import 'dart:developer';
import 'package:flutter_aitriage/aitriage_example_module/data/api/request/example_request.dart';
import 'package:flutter_aitriage/aitriage_example_module/data/api/response/example_response.dart';
import 'package:flutter_aitriage/aitriage_example_module/domain/repository/example_repository.dart';

abstract class ExampleUseCase {
  Future<ExampleResponse> execute(ExampleRequest request);
}

class ExampleUseCaseImpl implements ExampleUseCase {
  final ExampleRepository _exampleRepository;

  ExampleUseCaseImpl(this._exampleRepository);

  @override
  Future<ExampleResponse> execute(ExampleRequest request) async {
    return await _exampleRepository.doSomething(request);
  }
}