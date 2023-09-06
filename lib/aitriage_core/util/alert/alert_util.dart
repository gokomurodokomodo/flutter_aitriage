import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertUtil {
  AlertUtil._();

  static void showLoadingIndicator({
    Duration timeout = const Duration(seconds: 5)
  }) {
    closeAllAlert();
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
    Future.delayed(Duration.zero, () => Get.dialog(loadingIndicator, barrierDismissible: true));
    Future.delayed(timeout, () {
      if (key.currentContext?.mounted == true) {
        closeAllAlert();
      }
    });
  }

  static void showLoadingIndicatorWithText() {
    closeAllAlert();
  }

  static void showCustomDialog() {
    closeAllAlert();
  }

  static void closeAllAlert() => Future.delayed(Duration.zero, () => Get.back(closeOverlays: true));
}
