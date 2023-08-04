import 'package:get/get_navigation/src/routes/get_route.dart';
import '../feature/getting_started/getting_started_screen.dart';
import '../feature/intro/intro_screen.dart';
import '../feature/splash_screen/splash_screen.dart';

class MainPageRoute {
  MainPageRoute._();

  static const initialRoute = '/';
  static const gettingStarted = '/getting_started';
  static const intro = '/intro';

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
  ];
}