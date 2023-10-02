import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertUtil {
  AlertUtil._();

  static void showLoadingIndicator({
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
      };
    });
  }
  //
  // static void showLoadingIndicatorWithText() {
  //   // hideLoading();
  // }
  //
  // static void showCustomDialog() {
  //   // hideLoading();
  // }
}
