import 'package:flutter_aitriage/aitriage_core/network/handle_error/handle_error.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/verify_email_uc.dart';
import 'package:get/get.dart';
import '../../data/api/request/verify_email_request.dart';

class VerifyEmailController extends GetxController {
  final VerifyEmailUseCase _uc;
  var _verifyCode = '';

  VerifyEmailController(this._uc);

  void onInputCompleted(String verifyCode) => _verifyCode = verifyCode;

  void onSubmit() async {
    final argument = Get.arguments;
    final request = VerifyEmailRequest(
      email: argument?['email'],
      verificationCode: _verifyCode
    );

    try {
      final resp = await _uc.execute(request);
      Get.snackbar('Success', resp.message.toString());
    } catch (e) {
      HandleNetworkError.handleNetworkError(e, (message, _, __) => Get.snackbar('Error', message));
    }
  }
}