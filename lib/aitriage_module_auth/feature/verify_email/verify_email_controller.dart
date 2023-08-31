import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/verify_email_uc.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/common/app_error.dart';
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
      if (e is AppError) Get.snackbar('Error', e.message);
    }
  }
}