
import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/authentication_header.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_module_authen/config/authen_route.dart';
import 'package:flutter_aitriage/aitriage_module_authen/feature/forgot_password/forgot_password_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/ui/widget/back_to_login_text_button.dart';
import '../../../aitriage_core/ui/widget/color_button.dart';
import '../../../aitriage_core/ui/widget/custom_login_field.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController>{
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DeviceDetector(
        tablet: _Tablet(controller: controller,),
        phone: _Phone());
  }
}

class _Tablet extends StatelessWidget{
  final ForgotPasswordController controller;

  const _Tablet({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            AuthenticationHeader(
              headerText: 'forgot_password'.tr,
              contentText: 'forgot_password_label'.tr,
            ),
            SizedBox(
              child: CustomLoginField(
                onTextChange: (_) => controller.onTextEmailChange(_),
                // isValidated: widget.controller.isValidEmail.value,
                label: 'email_label'.tr,
                hintText: 'email_hint'.tr,
              ),
            ),
              SizedBox(height: 24.h,),
              SizedBox(
                width: 450.w,
                child: ColorButton(
                  onTap: () => Get.toNamed(AuthenRoute.checkYourEmail),
                  title: 'reset_password'.tr,
                  shouldEnable: true,
                ),
              ),
            SizedBox(height: 32.h,),
            const BackToLoginTextButton(),
          ],
        ),
      ),
    );
  }

}




class _Phone extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

}