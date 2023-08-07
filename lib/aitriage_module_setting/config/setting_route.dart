import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingRoute {
  SettingRoute._();

  static const nestedId = 3000;
  static final nestedKey = Get.nestedKey(nestedId);
  static const _root = '/setting';
  static const initialRoute = '$_root/home';

  static Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == initialRoute) {
      return GetPageRoute(
          page: () => const Scaffold(),
          binding: BindingsBuilder(() {
          })
      );
    }

    return null;
  }

  static List<GetPage> createRoutes() => [

  ];
}