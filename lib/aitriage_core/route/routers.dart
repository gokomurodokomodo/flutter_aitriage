import 'package:flutter/cupertino.dart';
import 'package:flutter_aitriage/home_screen/page/home_screen_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routers {
  static const initialRoute = '/';
  static const intro = '/intro';

  static List<GetPage> getPages = [
    GetPage(
        name: initialRoute,
        page: () => const HomeScreenPage()),
    GetPage(
        name: intro,
        page: () => const Placeholder()),
  ];
}