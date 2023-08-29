import 'package:flutter_aitriage/aitriage_module_auth/data/api/response/register_account_response.dart';
import '../../data/api/request/register.dart';

abstract class SignUpRepository {
  Future<RegisterAccountResponse> register(RegisterRequest request);
  generateCodeEmail2Fa();
}