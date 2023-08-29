
import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/authentication_header.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/common/app_color.dart';
import '../../../aitriage_core/common/app_image.dart';
import '../../../aitriage_core/ui/widget/back_to_login_text_button.dart';
import '../../../aitriage_core/ui/widget/color_button.dart';
import '../../../aitriage_core/ui/widget/custom_login_field.dart';
import '../../config/auth_module_page_route.dart';
import 'forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DeviceDetector(
        tablet: const _Tablet(),
        phone: _Phone());
  }
}

class _Tablet extends GetView<ForgotPasswordController> {
  const _Tablet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorAppBackground,
      body: SingleChildScrollView(
        reverse: true,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 160.h),
              AuthenticationHeader(
                headerText: 'forgot_password'.tr,
                contentText: 'forgot_password_label'.tr,
                svgIconNameWithBorder: AppImage.svgKey,
              ),
              SizedBox(height: 32.h),
              SizedBox(
                child: CustomLoginField(
                  onTextChange: (_) => controller.onTextEmailChange(_),
                  // isValidated: widget.controller.isValidEmail.value,
                  label: 'email_label'.tr,
                  hintText: 'forget_password_email_hint'.tr,
                ),
              ),
                SizedBox(height: 24.h,),
                ColorButton(
                  onTap: () => Get.toNamed(AuthModulePageRoute.checkYourEmail),
                  title: 'reset_password'.tr,
                  shouldEnable: true,
                  width: 360.w,
                ),
              SizedBox(height: 32.h,),
              const BackToLoginTextButton(
              ),
            ],
          ),
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