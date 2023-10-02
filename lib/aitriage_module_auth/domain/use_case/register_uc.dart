import 'dart:async';
import 'package:flutter_aitriage/aitriage_module_auth/data/api/request/register_request.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/repository/sign_up_repository.dart';
import '../../../aitriage_core/network/common/base_response.dart';
import '../../data/api/request/generate_code_request.dart';

abstract class RegisterUseCase {
  Future<BaseResponse> execute(RegisterRequest request);
}

class RegisterUseCaseImpl implements RegisterUseCase {
  final SignUpRepository _repository;

  RegisterUseCaseImpl(this._repository);

  @override
  Future<BaseResponse> execute(RegisterRequest request) async {
    final generateCodeRequest = GenerateCodeRequest(
        email: request.email,
        reason: 'FOR_REGISTER'
    );
    await _repository.register(request);
    final generateCodeResp = await _repository.generateCodeEmail2Fa(generateCodeRequest);

    return generateCodeResp;
  }
}