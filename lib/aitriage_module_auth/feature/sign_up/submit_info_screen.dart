import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/color_button.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_login_field.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_module_auth/config/auth_route.dart';
import 'package:flutter_aitriage/aitriage_module_auth/widget/drop_down_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../aitriage_core/common/app_color.dart';
import '../../../aitriage_core/common/app_style.dart';
import '../../widget/agree_term_and_privacy_policy_checkbox.dart';
import '../../widget/auth_back_button.dart';
import '../../widget/step_count_widget.dart';

class SubmitInfoScreen extends StatelessWidget {
  const SubmitInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _Tablet(),
        phone: _Phone());
  }
}

class _Tablet extends StatelessWidget {
  const _Tablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorAppBackground,
      body: Padding(
        padding: EdgeInsets.all(40.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: AuthBackButton(onTap: () => Get.back())),
              SizedBox(height: 60.h),
              SizedBox(
                  width: (240.h * 3) + (24.w * 2),
                  child: const StepCountWidget(index: 3)),
              SizedBox(height: 40.h),
              Text('Please add more information below', style: AppStyle.styleCheckYourEmailNotification),
              SizedBox(height: 24.h),
              const Center(
                child: CustomLoginField(
                  label: 'Organization name',
                  shouldIncludeAsterisk: true,
                  hintText: 'Organization name',
                ),
              ),
              SizedBox(height: 20.h),
              const DropDownButton(
                title: 'Country',
                shouldIncludeAsterisk: true,
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomLoginField(
                    label: 'First name',
                    shouldIncludeAsterisk: true,
                    hintText: 'First name',
                    textFieldWidth: 170.w,
                  ),
                  SizedBox(width: 20.w),
                  CustomLoginField(
                    label: 'Last name',
                    shouldIncludeAsterisk: true,
                    hintText: 'Last name',
                    textFieldWidth: 170.w,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              const Center(
                child: CustomLoginField(
                  label: 'Email',
                  shouldIncludeAsterisk: true,
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(height: 20.h),
              const Center(
                child: CustomLoginField(
                  label: 'Phone number',
                  shouldIncludeAsterisk: true,
                  hintText: 'Enter your phone number',
                ),
              ),
              SizedBox(height: 20.h),
              const Center(
                child: CustomLoginField(
                  label: 'Password',
                  shouldIncludeAsterisk: true,
                  hintText: 'Choose a password',
                ),
              ),
              SizedBox(height: 20.h),
              AgreeTermAndPrivacyPolicyCheckbox(width: 360.w),
              SizedBox(height: 32.h),
              ColorButton(title: 'Submit', shouldEnable: true, width: 360.w, onTap: () => Get.toNamed(AuthRoute.verifyEmail))
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


