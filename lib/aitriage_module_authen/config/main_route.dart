import 'package:get/get.dart';

import '../feature/sign_in/sign_in_controller.dart';
import '../feature/sign_in/sign_in_page.dart';

class AuthenRoute {
  AuthenRoute._();

  static const _root = '/main';
  static const signIn = '$_root/login';

  static List<GetPage> createRoutes() => [
    GetPage(
        name: signIn,
        page: () => const SignInPage(),
        binding: BindingsBuilder((){
          Get.lazyPut(() => SignInController());
        })
    ),
  ];
}