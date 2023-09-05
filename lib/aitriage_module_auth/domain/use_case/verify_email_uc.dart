import 'package:flutter_aitriage/aitriage_module_auth/domain/repository/sign_up_repository.dart';
import '../../../aitriage_core/network/common/base_response.dart';
import '../../data/api/request/verify_email_request.dart';

abstract class VerifyEmailUseCase {
  Future<BaseResponse> execute(VerifyEmailRequest request);
}

class VerifyEmailUseCaseImpl extends VerifyEmailUseCase {
  final SignUpRepository _repository;

  VerifyEmailUseCaseImpl(this._repository);

  @override
  Future<BaseResponse> execute(VerifyEmailRequest request) async {
    return await _repository.verifyEmail(request);
  }
}