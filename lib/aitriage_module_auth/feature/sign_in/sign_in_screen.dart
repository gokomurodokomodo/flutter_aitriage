import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_in/sign_in_controller.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/widget/remember_me_forgot_password.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/common/app_color.dart';
import '../../../aitriage_core/common/app_image.dart';
import '../../../aitriage_core/ui/widget/authentication_header.dart';
import '../../../aitriage_core/ui/widget/color_button.dart';
import '../../../aitriage_core/ui/widget/custom_login_field.dart';
import '../../config/auth_route.dart';
import '../widget/sign_in_divider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DeviceDetector(
        tablet: const _Tablet(),
        phone: _Phone());
  }
}

class _Tablet extends GetView<SignInController> {
  const _Tablet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        reverse: true,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 160.h),
              AuthenticationHeader(
                iconName: AppImage.svgAppLogo,
                headerText: 'welcome_back'.tr,
              ),
              SizedBox(height: 14.h),
                SizedBox(
                  child: CustomLoginField(
                    onTextChange: (_) => controller.onTextEmailChange(_),
                    // isValidated: widget.controller.isValidEmail.value,
                    label: 'email_label'.tr,
                    hintText: 'email_hint'.tr,
                  ),
                ),
              SizedBox(height: 14.h),
                CustomLoginField(
                  shouldSecured: true,
                  onTextChange: (_) =>
                      controller.onTextPasswordChange(_),
                  // isValidated: widget.controller.isValidPassword.value,
                  label: 'password_label'.tr,
                  hintText: 'password_hint'.tr,
                ),
              Obx(() {
                return SizedBox(
                  width: 450.w,
                  child: RememberAndForgotPassword(
                    isChecked: controller.isCheck.value,
                    onTapCheck: controller.onCheckBoxTap,
                  ),
                );
              }),
              SizedBox(
                  width: 450.w,
                  child: ColorButton(
                    title: 'sign_in'.tr,
                    shouldEnable: controller.isValidated.value,
                    // shouldEnable: widget.controller.isValidated.value,
                  ),
                ),
              SizedBox(height: 20.h,),
              SignInDivider(
                width: 450.w,
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 450.w,
                child: ColorButton(
                  title: 'sign_in_with_pin_code'.tr,
                  textStyle: const TextStyle(color: AppColor.colorRememberMeText),
                  shouldEnable: true,
                  colorActive: AppColor.colorButtonTextEnable,
                  onTap: () => Get.offNamed(AuthRoute.signInWithCode),
                ),
              ),
              SizedBox(
                width: 450.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('dont_have_account'.tr, style: AppStyle.styleRememberMeText,),
                    TextButton(
                        onPressed: (){},
                        child: const Text('Sign up')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Phone extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PhoneState();
}

class _PhoneState extends State<_Phone> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}