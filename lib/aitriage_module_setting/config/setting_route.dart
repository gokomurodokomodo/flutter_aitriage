import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_module_setting/feature/home_setting/home_setting_screen.dart';
import 'package:get/get.dart';

class SettingRoute {
  SettingRoute._();

  static const nestedId = 3000;
  static final nestedKey = Get.nestedKey(nestedId);
  static const _root = '/setting';
  static const initialRoute = '$_root/home';

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return GetPageRoute(
            settings: settings,
            page: () => const HomeSettingScreen(),
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