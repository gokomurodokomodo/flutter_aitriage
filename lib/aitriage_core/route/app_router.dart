import 'package:flutter_aitriage/aitriage_core/widget/getting_started_screen.dart';
import 'package:flutter_aitriage/aitriage_core/widget/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoute {
  static const initialRoute = '/';
  static const gettingStarted = '/getting_started';

  static List<GetPage> getPages = [
    GetPage(
        name: initialRoute,
        page: () => const SplashScreen()),
    GetPage(
        name: gettingStarted,
        page: () => const GettingStartedScreen()),
  ];
}