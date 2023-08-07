import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_module_overview/feature/home_overview/home_overview_controller.dart';
import 'package:flutter_aitriage/aitriage_module_overview/feature/home_overview/home_overview_screen.dart';
import 'package:get/get.dart';

class OverviewRoute {
  OverviewRoute._();
  // Key for nestedNavigation
  static const nestedId = 1000;
  static final nestedKey = Get.nestedKey(nestedId);
  // Route name
  static const _root = '/overview';
  static const initialRoute = '$_root/home';
  // For navigator onGenerateRoute
  static Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == initialRoute) {
      return GetPageRoute(
          page: () => const HomeOverviewScreen(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => HomeOverviewController());
          })
      );
    }

    return null;
  }

  static List<GetPage> createRoutes() => [

  ];
}