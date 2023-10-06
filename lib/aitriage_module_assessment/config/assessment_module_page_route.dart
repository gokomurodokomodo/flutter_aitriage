import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          page: () => const SizedBox(),
          // binding: HomeAssessmentBinding()
      ),
      _ => null
    };
  }

  // when navigate without id
  static List<GetPage> createRoutes() => [

  ];
}