import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_in/sign_in_controller.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_in/widget/remember_me_forgot_password.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/common/app_image.dart';
import '../../../aitriage_core/ui/widget/authentication_header.dart';
import '../../../aitriage_core/ui/widget/color_button.dart';
import '../../../aitriage_core/ui/widget/custom_login_field.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DeviceDetector(
        tablet: _Tablet(controller: controller,),
        phone: _Phone());
  }
}

class _Tablet extends StatefulWidget {
  final SignInController controller;

  const _Tablet({
    required this.controller
  });

  @override
  State<StatefulWidget> createState() => _TabletState();

}

class _TabletState extends State<_Tablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AuthenticationHeader(
              iconName: AppImage.svgAppLogo,
              headerText: 'welcome_back'.tr,
              contentText: 'enter_your_details'.tr,
            ),
              SizedBox(
                child: CustomLoginField(
                  onTextChange: (_) => widget.controller.onTextEmailChange(_),
                  // isValidated: widget.controller.isValidEmail.value,
                  label: 'email_label'.tr,
                  hintText: 'email_hint'.tr,
                ),
              ),
            SizedBox(height: 14.h),
              CustomLoginField(
                shouldSecured: true,
                onTextChange: (_) =>
                    widget.controller.onTextPasswordChange(_),
                // isValidated: widget.controller.isValidPassword.value,
                label: 'password_label'.tr,
                hintText: 'password_hint'.tr,
              ),
            Obx(() {
              return SizedBox(
                width: 450.w,
                child: RememberAndForgotPassword(
                  isChecked: widget.controller.isCheck.value,
                  onTapCheck: widget.controller.onCheckBoxTap,
                ),
              );
            }),
            Obx(() {
              return SizedBox(
                width: 450.w,
                child: ColorButton(
                  title: 'sign_in'.tr,
                  shouldEnable: widget.controller.isValidated.value,
                ),
              );
            }),
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