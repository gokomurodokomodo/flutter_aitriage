import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class OverviewPageRoute {
  OverviewPageRoute._();

  static const initialRoute = '/';

  static List<GetPage> createRoutes() => [
    GetPage(
        name: initialRoute,
        page: () => const Placeholder()),
  ];
}