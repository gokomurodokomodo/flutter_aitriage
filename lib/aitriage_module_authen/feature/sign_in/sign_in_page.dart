import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_module_authen/feature/sign_in/sign_in_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/common/app_image.dart';
import '../../../aitriage_core/ui/widget/authentication_header.dart';
import '../../../aitriage_core/ui/widget/color_button.dart';
import '../../../aitriage_core/ui/widget/custom_login_field.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

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
      body: GestureDetector(
        onTap: () => Get.focusScope?.unfocus(),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AuthenticationHeader(
                iconName: AppImage.svgAppLogo,
                headerText: 'welcome_back'.tr,
                contentText: 'enter_your_details'.tr,
              ),
              Obx(() {
                return CustomLoginField(
                  onTextChange: (_) => widget.controller.onTextEmailChange(_),
                  isValidated: widget.controller.isValidEmail.value,
                  label: 'email_label'.tr,
                  hintText: 'email_hint'.tr,
                );
              }),
              SizedBox(height: 14.h),
              Obx(() {
                return CustomLoginField(
                  onTextChange: (_) =>
                      widget.controller.onTextPasswordChange(_),
                  isValidated: widget.controller.isValidPassword.value,
                  label: 'password_label'.tr,
                  hintText: 'password_hint'.tr,
                );
              }),
              SizedBox(
                width: 450.w,
                child: GestureDetector(
                  onTap: () => widget.controller.onCheckBoxTap(!widget.controller.isCheck.value),
                  child: Row(
                    children: [
                      Obx(() {
                        return Row(
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: Checkbox(
                                value: widget.controller.isCheck.value,
                                onChanged: (_) => widget.controller.onCheckBoxTap(_!),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),),
                            ),
                            SizedBox(width: 8.w,),
                            Text('remember_me'.tr, style: AppStyle.styleRememberMeText,)
                          ],
                        );
                      }),
                      const Spacer(),
                      TextButton(
                          onPressed: (){},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero
                          ),
                          child: Text('forgot_password'.tr),

                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 450.w,
                child: ColorButton(
                  title: 'sign_in'.tr,
                  shouldEnable: widget.controller.isValidated.value,
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