import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssessmentRoute {
  AssessmentRoute._();

  static const nestedId = 2000;
  static final nestedKey = Get.nestedKey(nestedId);
  static const _root = '/assessment';
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