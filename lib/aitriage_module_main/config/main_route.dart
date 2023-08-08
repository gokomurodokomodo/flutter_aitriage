import 'package:flutter_aitriage/aitriage_module_assessment/feature/home_assessment/home_assessment_controller.dart';
import 'package:flutter_aitriage/aitriage_module_overview/feature/home_overview/home_overview_controller.dart';
import 'package:flutter_aitriage/aitriage_module_setting/feature/home_setting/home_setting_controller.dart';
import 'package:get/get.dart';
import '../feature/getting_started/getting_started_screen.dart';
import '../feature/home_main/home_main_controller.dart';
import '../feature/home_main/home_main_screen.dart';
import '../feature/intro/intro_screen.dart';
import '../feature/splash_screen/splash_screen.dart';

class MainRoute {
  MainRoute._();

  static const _root = '/main';
  static const initialRoute = '$_root/splash_screen';
  static const gettingStarted = '$_root/getting_started';
  static const intro = '$_root/intro';
  static const main = '$_root/home';

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
        page: () => const HomeMainScreen(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => HomeMainController());
          Get.lazyPut(() => HomeAssessmentController());
          Get.lazyPut(() => HomeOverviewController());
          Get.lazyPut(() => HomeSettingController());
        })),
  ];
}