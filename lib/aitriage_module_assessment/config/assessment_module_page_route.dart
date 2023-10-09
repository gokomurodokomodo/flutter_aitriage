import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/home/home_screen.dart';
import 'package:get/get.dart';

import '../feature/home/home_binding.dart';

class AssessmentModulePageRoute {
  AssessmentModulePageRoute._();
  // Key for nestedNavigation
  static const nestedId = 1000;
  static final nestedKey = Get.nestedKey(nestedId);
  // Route name
  static const _root = '/assessment';
  static const initialRoute = '$_root/home';

  // When navigate with id - nested navigation
  static Route? onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      initialRoute => GetPageRoute(
          settings: settings,
          page: () => const HomeScreen(),
          binding: HomeBinding()
      ),
      _ => null
    };
  }

  // when navigate without id
  static List<GetPage> createRoutes() => [

  ];
}