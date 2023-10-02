import 'package:flutter_aitriage/aitriage_module_auth/data/api/request/sign_in_request.dart';
import 'package:flutter_aitriage/aitriage_module_auth/data/api/response/user_param_response.dart';
import '../../data/api/request/verify_login_request.dart';

abstract class SignInRepository{
  Future<UserParamResponse> signIn(SignInRequest signInRequest);
  Future<UserParamResponse> signInWithCode(VerifyLoginRequest request);
}