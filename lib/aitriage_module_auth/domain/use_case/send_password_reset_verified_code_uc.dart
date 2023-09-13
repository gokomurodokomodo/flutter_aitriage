import 'package:flutter_aitriage/aitriage_module_auth/data/api/query/forget_password_query.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/repository/forget_password_repository.dart';
import '../../../aitriage_core/network/common/base_response.dart';

abstract class SendPasswordResetVerifiedCodeUseCase {
  Future<BaseResponse> execute(ForgetPasswordQuery query);
}

class SendPasswordResetVerifiedCodeUseCaseImpl extends SendPasswordResetVerifiedCodeUseCase {
  final ForgetPasswordRepository _repository;

  SendPasswordResetVerifiedCodeUseCaseImpl(this._repository);

  @override
  Future<BaseResponse> execute(ForgetPasswordQuery query) async {
    return await _repository.sendPasswordResetVerifiedCode(query);
  }
}


