import 'package:flutter_aitriage/aitriage_module_auth/data/api/request/sign_in_request.dart';
import '../../../aitriage_core/network/common/base_response.dart';
import '../../data/api/response/user_email_verify_response.dart';

abstract class SignInRepository{
  Future<UserVerifyEmailResponse> signIn(SignInRequest signInRequest);
}