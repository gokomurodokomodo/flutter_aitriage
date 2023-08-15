import 'package:flutter_aitriage/aitriage_module_authen/feature/check_your_email/check_your_email_controller.dart';
import 'package:flutter_aitriage/aitriage_module_authen/feature/check_your_email/check_your_email_page.dart';
import 'package:flutter_aitriage/aitriage_module_authen/feature/forgot_password/forgot_password_controller.dart';
import 'package:flutter_aitriage/aitriage_module_authen/feature/sign_in_with_pincode/sign_in_page.dart';
import 'package:flutter_aitriage/aitriage_module_authen/feature/sign_in_with_pincode/sign_in_with_pincode_controller.dart';
import 'package:flutter_aitriage/aitriage_module_authen/feature/widget/success_reset_password_page.dart';
import 'package:get/get.dart';

import '../feature/forgot_password/forgot_password_page.dart';
import '../feature/sign_in/sign_in_controller.dart';
import '../feature/sign_in/sign_in_page.dart';

class AuthenRoute {
  AuthenRoute._();

  static const _root = '/main';
  static const signIn = '$_root/login';
  static const signInWithCode = '$_root/login_with_code';
  static const forgotPassword = '$_root/forgot_password';
  static const checkYourEmail = '$_root/check_your_email';
  static const successResetPassword = '$_root/success';

  static List<GetPage> createRoutes() => [
    GetPage(
        name: signIn,
        page: () => const SignInPage(),
        binding: BindingsBuilder((){
          Get.lazyPut(() => SignInController());
        })
    ),
    GetPage(
        name: signInWithCode,
        page: () => const SignInPageWithPinCode(),
        binding: BindingsBuilder((){
          Get.lazyPut(() => SignInWithPinCodeController());
        })),
    GetPage(
        name: forgotPassword,
        page: () => const ForgotPasswordPage(),
        binding: BindingsBuilder((){
          Get.lazyPut(() => ForgotPasswordController());
        })
    ),
    GetPage(
        name: checkYourEmail,
        page: () => const CheckYourEmailPage(),
        binding: BindingsBuilder((){
          Get.lazyPut(() => CheckYourEmailController());
        })
    ),
    GetPage(
        name: successResetPassword,
        page: () => const SuccessResetPasswordPage()
    )
  ];
}