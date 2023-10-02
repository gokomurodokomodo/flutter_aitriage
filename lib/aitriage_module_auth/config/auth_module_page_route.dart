import 'package:flutter_aitriage/aitriage_module_auth/feature/check_your_email/check_your_email_screen.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/forget_password/forget_password_binding.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/set_new_password/set_new_password_screen.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_in/sign_in_binding.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_in_with_pincode/sign_in_with_pincode_screen.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/register_account_status/register_account_status_screen.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/verify_email/verify_email_binding.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/verify_email/verify_email_screen.dart';
import 'package:get/get.dart';
import '../feature/check_your_email/check_your_email_binding.dart';
import '../feature/forget_password/forget_password_screen.dart';
import '../feature/sign_in/sign_in_screen.dart';
import '../feature/sign_in_with_pincode/sign_in_with_pincode_binding.dart';
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
            binding: SignInBinding()),
        GetPage(
            name: signInWithCode,
            page: () => const SignInWithPinCodeScreen(),
            binding: SignInWithPinCodeBinding()),
        GetPage(
            name: forgotPassword,
            page: () => const ForgetPasswordScreen(),
            binding: ForgetPasswordBinding()),
        GetPage(
            name: checkYourEmail,
            page: () => const CheckYourEmailScreen(),
            binding: CheckYourEmailBinding()),
        GetPage(
            name: successResetPassword,
            page: () => const SuccessResetPasswordScreen()),
        GetPage(name: setNewPassword,
            page: () => const SetNewPasswordScreen()),
        GetPage(
            name: registerAccountType,
            page: () => const RegisterAccountTypeScreen()),
        GetPage(
            name: registerAccountStatus,
            page: () => const RegisterAccountStatusScreen()),
        GetPage(
            name: submitInfo,
            page: () => const SubmitInfoScreen()),
        GetPage(
            name: verifyEmail,
            page: () => const VerifyEmailScreen(),
            binding: VerifyEmailBinding())
      ];
}
