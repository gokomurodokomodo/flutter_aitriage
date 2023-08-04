import 'package:flutter_aitriage/aitriage_module_main/feature/main_screen/main_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../feature/getting_started/getting_started_screen.dart';
import '../feature/intro/intro_screen.dart';
import '../feature/splash_screen/splash_screen.dart';

class MainPageRoute {
  MainPageRoute._();

  static const initialRoute = '/';
  static const gettingStarted = '/getting_started';
  static const intro = '/intro';
  static const main = '/main';

  static List<GetPage> createRoutes() => [
    GetPage(
        name: initialRoute,
        page: () => const SplashScreen()),
    GetPage(
        name: gettingStarted,
        page: () => const GettingStartedScreen()),
    GetPage(
        name: intro,
        page: () => const IntroScreen()),
    GetPage(
        name: main,
        page: () => const MainScreen()),
  ];
}