import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/network/handle_error/handle_error.dart';
import '../../data/api/query/forget_password_query.dart';
import '../../domain/use_case/send_password_reset_verified_code.dart';
import 'package:open_mail_app/open_mail_app.dart';

class CheckYourEmailController extends GetxController{
  final SendPasswordResetVerifiedCodeUseCase _uc;
  var userEmail = ''.obs;

  CheckYourEmailController(this._uc);

  @override
  void onInit() {
    super.onInit();
    userEmail.value = Get.arguments?['email'] ?? '';
  }

  void openEmailApp() async {
    var result = await OpenMailApp.openMailApp();
    if (!result.didOpen && !result.canOpen) {
      showNoMailAppsDialog(Get.context!);

      // iOS: if multiple mail apps found, show dialog to select.
      // There is no native intent/default app system in iOS so
      // you have to do it yourself.
    } else if (!result.didOpen && result.canOpen) {
      showDialog(
        context: Get.context!,
        builder: (_) {
          return MailAppPickerDialog(
            mailApps: result.options,
          );
        },
      );
    }
  }
  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Open Mail App"),
          content: Text("No mail apps installed"),
          actions: <Widget>[
          ],
        );
      },
    );
  }

  void resend() async {
    final query = ForgetPasswordQuery(userEmail.value);

    try {
      await _uc.execute(query);
    } catch (e) {
      HandleNetworkError.handleNetworkError(e, (message) => Get.snackbar('Error', message));
    }
  }
}