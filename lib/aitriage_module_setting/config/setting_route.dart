
import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_module_setting/feature/about_us/about_us_screen.dart';
import 'package:flutter_aitriage/aitriage_module_setting/feature/home_setting/home_setting_screen.dart';
import 'package:flutter_aitriage/aitriage_module_setting/feature/support_center/support_center_screen.dart';
import 'package:get/get.dart';

class SettingRoute {
  SettingRoute._();

  static const nestedId = 2000;
  static final nestedKey = Get.nestedKey(nestedId);
  static const _root = '/setting';
  static const initialRoute = '$_root/home';
  static const supportCenter = '$_root/support_center';
  static const aboutUs = '$_root/about_us';

  static Route? onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      initialRoute => GetPageRoute(
            settings: settings,
            page: () => const HomeSettingScreen(),
            binding: BindingsBuilder(() {})
        ),
      supportCenter => GetPageRoute(
            settings: settings,
            page: () => const SupportCenterScreen(),
            binding: BindingsBuilder(() {})
        ),
      aboutUs => GetPageRoute(
            settings: settings,
            page: () => const AboutUsScreen(),
            binding: BindingsBuilder(() {})
        ),
      _ => GetPageRoute(
            settings: settings,
            page: () => const Scaffold())
    };
  }

  static List<GetPage> createRoutes() => [

  ];
}