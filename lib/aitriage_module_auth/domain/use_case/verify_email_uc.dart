import 'package:flutter_aitriage/aitriage_module_auth/data/repository/sign_in_repository.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/repository/sign_up_repository.dart';
import '../../../aitriage_core/network/common/base_response.dart';
import '../../data/api/request/verify_email_request.dart';
import '../../data/api/request/verify_login_request.dart';

abstract class VerifyEmailUseCase {
  Future<BaseResponse> execute(VerifyEmailRequest request);
  Future<BaseResponse> loginWithVerificationCode(VerifyLoginRequest request);
}

class VerifyEmailUseCaseImpl extends VerifyEmailUseCase {
  final SignUpRepository _repository;
  final SignInRepositoryImpl _signInRepository;

  VerifyEmailUseCaseImpl(this._repository, this._signInRepository);

  @override
  Future<BaseResponse> execute(VerifyEmailRequest request) async {
    return await _repository.verifyEmail(request);
  }

  @override
  Future<BaseResponse> loginWithVerificationCode(VerifyLoginRequest request) async {
    return await _signInRepository.signInWithCode(request);
  }
}