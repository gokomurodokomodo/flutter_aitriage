import 'package:flutter_aitriage/aitriage_module_auth/feature/check_your_email/check_your_email_screen.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/set_new_password/set_new_password_screen.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_in_with_pincode/sign_in_with_pincode_screen.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/choose_hospital_screen.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/organization_info_screen.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/submit_info_screen.dart';
import 'package:get/get.dart';
import '../feature/check_your_email/check_your_email_controller.dart';
import '../feature/forgot_password/forgot_password_controller.dart';
import '../feature/forgot_password/forgot_password_screen.dart';
import '../feature/sign_in/sign_in_controller.dart';
import '../feature/sign_in/sign_in_screen.dart';
import '../feature/sign_in_with_pincode/sign_in_with_pincode_controller.dart';
import '../feature/success_reset_password/success_reset_password_screen.dart';

class AuthRoute {
  AuthRoute._();

  static const _root = '/auth';
  static const signIn = '$_root/login';
  static const signInWithCode = '$_root/login_with_code';
  static const forgotPassword = '$_root/forgot_password';
  static const checkYourEmail = '$_root/check_your_email';
  static const successResetPassword = '$_root/success';
  static const setNewPassword = '$_root/set_new_password';
  static const chooseHospital = '$_root/choose_hospital';
  static const organizationInfo = '$_root/organization_info';
  static const submitInfo = '$_root/submit_info';

  static List<GetPage> createRoutes() => [
    GetPage(
        name: signIn,
        page: () => const SignInScreen(),
        binding: BindingsBuilder((){
          Get.lazyPut(() => SignInController());
        })),
    GetPage(
        name: signInWithCode,
        page: () => const SignInWithPinCodeScreen(),
        binding: BindingsBuilder((){
          Get.lazyPut(() => SignInWithPinCodeController());
        })),
    GetPage(
        name: forgotPassword,
        page: () => const ForgotPasswordScreen(),
        binding: BindingsBuilder((){
          Get.lazyPut(() => ForgotPasswordController());
        })),
    GetPage(
        name: checkYourEmail,
        page: () => const CheckYourEmailScreen(),
        binding: BindingsBuilder((){
          Get.lazyPut(() => CheckYourEmailController());
        })),
    GetPage(
        name: successResetPassword,
        page: () => const SuccessResetPasswordScreen()),
    GetPage(
        name: setNewPassword,
        page: () => const SetNewPasswordScreen()),
    GetPage(
        name: chooseHospital,
        page: () => const ChooseHospitalScreen()),
    GetPage(
        name: organizationInfo,
        page: () => const OrganizationInfoScreen()),
    GetPage(
        name: submitInfo,
        page: () => const SubmitInfoScreen())
  ];
}