import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertUtil {
  AlertUtil._();

  static GlobalKey showLoadingIndicator({
    Duration timeout = const Duration(seconds: 5)
  }) {
    final key = GlobalKey();
    final loadingIndicator = Center(
      key: key,
      child: const SizedBox(
        width: 100,
        height: 100,
        child: CircularProgressIndicator(
          strokeWidth: 6,
        ),
      ),
    );
    Get.dialog(loadingIndicator, barrierDismissible: true, arguments: key);

    Future.delayed(timeout, () {
      if (key.currentContext?.mounted == true && Get.isDialogOpen == true) {
        Get.back();
      }
    });
    return key;
  }

  // Using key to close dialog
  static void hideLoadingIndicator(GlobalKey key) {
    if (key.currentContext?.mounted == true && Get.isDialogOpen == true) {
      Get.back();
    }
  }
}
