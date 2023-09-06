import 'package:flutter_aitriage/aitriage_module_auth/data/api/request/generate_code_request.dart';
import '../../../aitriage_core/network/common/base_response.dart';
import '../../data/api/request/register_request.dart';
import '../../data/api/request/verify_email_request.dart';

abstract class SignUpRepository {
  Future<BaseResponse> register(RegisterRequest request);
  Future<BaseResponse> generateCodeEmail2Fa(GenerateCodeRequest request);
  Future<BaseResponse> verifyEmail(VerifyEmailRequest request);
}