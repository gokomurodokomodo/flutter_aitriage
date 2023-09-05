import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/send_password_reset_verified_code.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/network/handle_error/handle_error.dart';
import '../../data/api/query/forget_password_query.dart';

class ForgotPasswordController extends GetxController{
  final SendPasswordResetVerifiedCodeUseCase _uc;

  ForgotPasswordController(this._uc);

  onTextEmailChange(String email) {}

  void _sendCode(String email) async {
    final query = ForgetPasswordQuery(email);

    try {
      await _uc.execute(query);
    } catch (e) {
      HandleNetworkError.handleNetworkError(e, (message) => Get.snackbar('Error', message));
    }
  }
}