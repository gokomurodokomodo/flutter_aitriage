import 'dart:async';
import 'package:flutter_aitriage/aitriage_module_auth/data/api/request/register.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/repository/sign_up_repository.dart';
import '../../data/api/response/register_account_response.dart';

abstract class RegisterUseCase {
  Future<RegisterAccountResponse> execute(RegisterRequest request);
}

class RegisterUseCaseImpl implements RegisterUseCase {
  final SignUpRepository _repository;

  RegisterUseCaseImpl(this._repository);

  @override
  Future<RegisterAccountResponse> execute(RegisterRequest request) async {
    final resp = _repository.register(request);
    return resp;
  }
}