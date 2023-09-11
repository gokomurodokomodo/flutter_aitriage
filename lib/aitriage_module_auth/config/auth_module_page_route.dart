import 'package:flutter_aitriage/aitriage_module_auth/data/repository/sign_in_repository.dart';
import 'package:flutter_aitriage/aitriage_module_auth/data/repository/forget_password_repository.dart';
import 'package:flutter_aitriage/aitriage_module_auth/data/repository/sign_up_repository.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/register_uc.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/sign_in_uc.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/send_password_reset_verified_code.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/verify_email_uc.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/check_your_email/check_your_email_screen.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/set_new_password/set_new_password_screen.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_in_with_pincode/sign_in_with_pincode_screen.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/controller/sign_up_controller.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/register_account_status/register_account_status_screen.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/register_account_type/register_account_type_controller.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/submit_info/submit_info_controller.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/verify_email/verify_email_controller.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/verify_email/verify_email_screen.dart';
import 'package:get/get.dart';
import '../feature/check_your_email/check_your_email_controller.dart';
import '../feature/forgot_password/forgot_password_controller.dart';
import '../feature/forgot_password/forgot_password_screen.dart';
import '../feature/sign_in/sign_in_controller.dart';
import '../feature/sign_in/sign_in_screen.dart';
import '../feature/sign_in_with_pincode/sign_in_with_pincode_controller.dart';
import '../feature/sign_up/register_account_status/register_account_status_controller.dart';
import '../feature/sign_up/register_account_type/register_account_type_screen.dart';
import '../feature/sign_up/submit_info/submit_info_screen.dart';
import '../feature/success_reset_password/success_reset_password_screen.dart';

class AuthModulePageRoute {
  AuthModulePageRoute._();

  static const _root = '/auth';
  static const signIn = '$_root/login';
  static const signInWithCode = '$_root/login_with_code';
  static const forgotPassword = '$_root/forgot_password';
  static const checkYourEmail = '$_root/check_your_email';
  static const successResetPassword = '$_root/success';
  static const setNewPassword = '$_root/set_new_password';
  static const registerAccountType = '$_root/register_account_type';
  static const registerAccountStatus = '$_root/organization_info';
  static const submitInfo = '$_root/submit_info';
  static const verifyEmail = '$_root/verify_email';

  static List<GetPage> createRoutes() => [
        GetPage(
            name: signIn,
            page: () => const SignInScreen(),
            binding: BindingsBuilder(() {
              Get.lazyPut(() => SignUpRepositoryImpl());
              Get.lazyPut(() => SignInRepositoryImpl());
              Get.lazyPut(() => SignInUseCaseImpl(Get.find(), Get.find()));
              Get.lazyPut(() => SignInController(Get.find()));
            })),
        GetPage(
            name: signInWithCode,
            page: () => const SignInWithPinCodeScreen(),
            binding: BindingsBuilder(() {
              Get.lazyPut(() => SignInWithPinCodeController());
            })),
        GetPage(
            name: forgotPassword,
            page: () => const ForgotPasswordScreen(),
            binding: BindingsBuilder(() {
              Get.lazyPut(() => ForgetPasswordRepositoryImpl());
              Get.lazyPut(() => SendPasswordResetVerifiedCodeUseCaseImpl(Get.find<ForgetPasswordRepositoryImpl>()));
              Get.lazyPut(() => ForgotPasswordController(Get.find<SendPasswordResetVerifiedCodeUseCaseImpl>()));
            })),
        GetPage(
            name: checkYourEmail,
            page: () => const CheckYourEmailScreen(),
            binding: BindingsBuilder(() {
              Get.lazyPut(() => SignUpRepositoryImpl());
              Get.lazyPut(() => CheckYourEmailController(Get.find<SendPasswordResetVerifiedCodeUseCaseImpl>()));
            })),
        GetPage(
            name: successResetPassword,
            page: () => const SuccessResetPasswordScreen()),
        GetPage(name: setNewPassword,
            page: () => const SetNewPasswordScreen()),
        GetPage(
            name: registerAccountType,
            page: () => const RegisterAccountTypeScreen(),
            binding: BindingsBuilder(() {
              Get.lazyPut(() => SignUpRepositoryImpl());
              Get.lazyPut(() => RegisterUseCaseImpl(Get.find<SignUpRepositoryImpl>()));
              Get.lazyPut(() => SignUpController(Get.find<RegisterUseCaseImpl>()));
            })),
        GetPage(
            name: registerAccountStatus,
            page: () => const RegisterAccountStatusScreen(),
            binding: BindingsBuilder(() {
              Get.put(() => Get.find(tag: 'signUpController'));
            })),
        GetPage(
            name: submitInfo,
            page: () => const SubmitInfoScreen(),
            binding: BindingsBuilder(() {
              Get.put(() => Get.find(tag: 'signUpController'));
            })),
        GetPage(
            name: verifyEmail,
            page: () => const VerifyEmailScreen(),
            binding: BindingsBuilder(() {
              Get.lazyPut(() => SignUpRepositoryImpl());
              Get.lazyPut(() => SignInRepositoryImpl());
              Get.lazyPut(() => VerifyEmailUseCaseImpl(Get.find<SignUpRepositoryImpl>(), Get.find()));
              Get.lazyPut(() => VerifyEmailController(Get.find<VerifyEmailUseCaseImpl>()));
            })
        )
      ];
}
