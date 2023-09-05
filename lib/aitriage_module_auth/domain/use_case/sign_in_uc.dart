import 'package:flutter_aitriage/aitriage_module_auth/data/api/request/sign_in_request.dart';
import 'package:flutter_aitriage/aitriage_module_auth/data/repository/sign_in_repository.dart';
import '../../../aitriage_core/network/common/base_response.dart';
import '../../data/api/response/user_email_verify_response.dart';

abstract class SignInUseCase{
  Future<BaseResponse> execute(SignInRequest request);
}

class SignInUseCaseImpl extends SignInUseCase{
  final SignInRepositoryImpl _repository;

  SignInUseCaseImpl(this._repository);

  @override
  Future<UserVerifyEmailResponse> execute(SignInRequest request) async{
    final result = await _repository.signIn(request);
    return result;
  }

}