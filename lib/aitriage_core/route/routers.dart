import 'package:flutter/cupertino.dart';
import 'package:flutter_aitriage/aitriage_core/widget/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routers {
  static const initialRoute = '/';
  static const intro = '/intro';

  static List<GetPage> getPages = [
    GetPage(
        name: initialRoute,
        page: () => const SplashScreen()),
    GetPage(
        name: intro,
        page: () => const Placeholder()),
  ];
}