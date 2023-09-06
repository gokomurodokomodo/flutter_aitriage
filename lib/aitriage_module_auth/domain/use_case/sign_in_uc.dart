import 'package:flutter_aitriage/aitriage_module_auth/data/api/request/sign_in_request.dart';
import 'package:flutter_aitriage/aitriage_module_auth/data/api/response/user_param_response.dart';
import 'package:flutter_aitriage/aitriage_module_auth/data/repository/sign_in_repository.dart';
import 'package:flutter_aitriage/aitriage_module_auth/data/repository/sign_up_repository.dart';
import '../../../aitriage_core/network/common/base_response.dart';
import '../../data/api/request/generate_code_request.dart';

abstract class SignInUseCase{
  Future<UserParamResponse> execute(SignInRequest request);
  Future<BaseResponse> genCodeForSignIn(String email);
}

class SignInUseCaseImpl extends SignInUseCase{
  final SignInRepositoryImpl _repository;
  final SignUpRepositoryImpl _genCodeRepository;

  SignInUseCaseImpl(this._repository, this._genCodeRepository);

  @override
  Future<UserParamResponse> execute(SignInRequest request) async{
    final result = await _repository.signIn(request);
    return result;
  }

  @override
  Future<BaseResponse> genCodeForSignIn(String email) async{
    final request = GenerateCodeRequest(
      email: email,
      reason: 'VERIFY_EMAIL'
    );
    final result = await _genCodeRepository.generateCodeEmail2Fa(request);
    return result;
  }

}