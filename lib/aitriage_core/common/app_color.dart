import 'dart:ui';

import 'package:flutter/material.dart';

class AppColor {
  AppColor._();
  // Gradient
  static const gradientGettingStartedButton = LinearGradient(
      colors: [
        Color.fromRGBO(255, 255, 255, 0.10),
        Color.fromRGBO(255, 255, 255, 0.08)]);
  // Color
  static const colorAppPrimary = Color(0xFF0151FC);
  static const colorButtonBackgroundEnable = Color(0xff2F9DFE);
  static const colorButtonTextEnable = Color(0xffFFFFFF);
  static const colorButtonTextDisable = Color(0xff5B616E);
  static const colorBorderDisable = Color(0xffDBDBDB);
  static const colorDialogTitleText = Color(0xff1C1C1C);
  static const colorCloseButton = Color(0xFFA9A9A9);
  static const colorAlertHeader = Color(0xFF1B1B1B);
  static const colorTextGettingStarted = Color(0xffECECEC);
  static const colorSearchBar = Color(0xffa9a9a9);
  static const colorSliderButtonEnable = Color(0xff129961);
  static const colorSliderButtonDisable = Colors.red;
  static const colorRailHover = Color(0xffE6EFFE);
}