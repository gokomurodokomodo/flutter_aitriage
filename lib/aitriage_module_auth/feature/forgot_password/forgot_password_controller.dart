import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/send_password_reset_verified_code.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/network/handle_error/handle_error.dart';
import '../../data/api/query/forget_password_query.dart';

class ForgotPasswordController extends GetxController{
  final SendPasswordResetVerifiedCodeUseCase _uc;
  var _email = '';

  ForgotPasswordController(this._uc);

  void onTextEmailChange(String email) {
    _email = email;
  }

  void sendCode(Function(String)? sendCodeSuccessCallback) async {
    final query = ForgetPasswordQuery(_email);

    try {
      await _uc.execute(query);
      sendCodeSuccessCallback?.call(_email);
    } catch (e) {
      HandleNetworkError.handleNetworkError(e, (message, _, __) => Get.snackbar('Error', message));
    }
  }
}