import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_module_auth/widget/check_box_with_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../aitriage_core/common/app_image.dart';
import '../../../aitriage_core/ui/widget/authentication_header.dart';
import '../../../aitriage_core/ui/widget/custom_login_field.dart';

class SetNewPasswordScreen extends StatelessWidget {
  const SetNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _Tablet(),
        phone: _Phone()
    );
  }
}

class _Tablet extends StatelessWidget {
  const _Tablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 160.h),
              AuthenticationHeader(
                headerText: 'set_new_password_title'.tr,
                iconWithBorder: AppImage.svgEmail,
              ),
              SizedBox(height: 32.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomLoginField(
                    shouldSecured: true,
                    label: 'password_label'.tr,
                    hintText: 'enter_new_password_hint'.tr,
                  ),
                  SizedBox(height: 20.h),
                  CustomLoginField(
                    shouldSecured: true,
                    label: 'confirm_pass_word_title'.tr,
                    hintText: 'confirm_password_hint'.tr,
                  ),
                  SizedBox(height: 20.h),
                  CheckBoxWithText(text: 'Minimum 8 characters', isCheck: true),
                  SizedBox(height: 12.h),
                  CheckBoxWithText(text: 'At least 1 lowercase letter', isCheck: true),
                  SizedBox(height: 12.h),
                  CheckBoxWithText(text: 'At least 1 UPPERCASE letter', isCheck: true),
                  SizedBox(height: 12.h),
                  CheckBoxWithText(text: 'At least 1 number', isCheck: true),
                  SizedBox(height: 12.h),
                  CheckBoxWithText(text: 'At least 1 special character', isCheck: true),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Phone extends StatelessWidget {
  const _Phone({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

