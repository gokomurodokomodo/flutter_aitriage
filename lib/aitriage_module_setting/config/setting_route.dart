import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_module_setting/feature/about_us/about_us_screen.dart';
import 'package:flutter_aitriage/aitriage_module_setting/feature/home_setting/home_setting_screen.dart';
import 'package:flutter_aitriage/aitriage_module_setting/feature/support_center/support_center_screen.dart';
import 'package:get/get.dart';

class SettingRoute {
  SettingRoute._();

  static const nestedId = 3000;
  static final nestedKey = Get.nestedKey(nestedId);
  static const _root = '/setting';
  static const initialRoute = '$_root/home';
  static const supportCenter = '$_root/support_center';
  static const aboutUs = '$_root/about_us';

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return GetPageRoute(
            settings: settings,
            page: () => const HomeSettingScreen(),
            binding: BindingsBuilder(() {})
        );
      case supportCenter:
        return GetPageRoute(
            settings: settings,
            page: () => const SupportCenterScreen(),
            binding: BindingsBuilder(() {})
        );
      case aboutUs:
        return GetPageRoute(
            settings: settings,
            page: () => const AboutUsScreen(),
            binding: BindingsBuilder(() {})
        );
      default:
        return GetPageRoute(
            settings: settings,
            page: () => const Scaffold());
    }
  }

  static List<GetPage> createRoutes() => [

  ];
}