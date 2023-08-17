import 'package:flutter_aitriage/aitriage_module_main/feature/getting_started/getting_started_main_screen.dart';
import 'package:get/get.dart';
import '../feature/getting_started/getting_started_screen.dart';
import '../feature/home_main/home_main_controller.dart';
import '../feature/home_main/home_main_screen.dart';
import '../feature/intro/intro_screen.dart';

class MainRoute {
  MainRoute._();

  static const _root = '/main';
  static const gettingStarted = '$_root/getting_started';
  static const intro = '$_root/intro';
  static const main = '$_root/home';
  static const signIn = '$_root/sign_in';
  static const gettingStartedMain = '$_root/getting_started_main';

  static List<GetPage> createRoutes() => [
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
        })),
    GetPage(
        name: gettingStartedMain,
        page: () => const GettingStartedMainScreen()),
  ];
}