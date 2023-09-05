import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/color_button.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_login_field.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/submit_info/submit_info_controller.dart';
import 'package:flutter_aitriage/aitriage_module_auth/widget/drop_down_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../aitriage_core/common/app_color.dart';
import '../../../../aitriage_core/common/app_style.dart';
import '../../../../aitriage_core/util/global_function.dart';
import '../../../config/auth_module_page_route.dart';
import '../../../widget/agree_term_and_privacy_policy_checkbox.dart';
import '../../../widget/auth_back_button.dart';
import '../../../widget/step_count_widget.dart';

class SubmitInfoScreen extends StatelessWidget {
  const SubmitInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _Tablet(),
        phone: _Phone());
  }
}

class _Tablet extends GetView<SubmitInfoController> {
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
              Center(
                child: CustomLoginField(
                  label: 'Organization name',
                  enableLabelAsterisk: true,
                  hintText: 'Organization name',
                  onTextChange: (value) => controller.onOrganizationNameChanged(value),
                ),
              ),
              SizedBox(height: 20.h),
              DropDownButton(
                title: 'Country',
                shouldIncludeAsterisk: true,
                dropDownWidth: 360.w,
                onTapChildren: (index) => controller.onCountryChanged(index),
                children: countryList.map((e) => CountryWidget(
                  isNetworkIcon: true,
                  leftIconName: e.emoji,
                  contentText: e.name,
                )).toList(),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomLoginField(
                    label: 'First name',
                    enableLabelAsterisk: true,
                    hintText: 'First name',
                    textFieldWidth: 170.w,
                    onTextChange: (value) => controller.onFirstNameChanged(value),
                  ),
                  SizedBox(width: 20.w),
                  CustomLoginField(
                    label: 'Last name',
                    enableLabelAsterisk: true,
                    hintText: 'Last name',
                    textFieldWidth: 170.w,
                    onTextChange: (value) => controller.onLastNameChanged(value),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Center(
                child: CustomLoginField(
                  label: 'Email',
                  enableLabelAsterisk: true,
                  hintText: 'Enter your email',
                  onTextChange: (value) => controller.onEmailChanged(value),
                ),
              ),
              SizedBox(height: 20.h),
              Center(
                child: CustomLoginField(
                  label: 'Phone number',
                  enableLabelAsterisk: true,
                  hintText: 'Enter your phone number',
                  onTextChange: (value) => controller.onPhoneNumberChanged(value),
                ),
              ),
              SizedBox(height: 20.h),
              Center(
                child: CustomLoginField(
                  label: 'Password',
                  enableLabelAsterisk: true,
                  hintText: 'Choose a password',
                  onTextChange: (value) => controller.onPasswordChanged(value),
                ),
              ),
              SizedBox(height: 20.h),
              AgreeTermAndPrivacyPolicyCheckbox(width: 360.w),
              SizedBox(height: 32.h),
              ColorButton(title: 'Submit', shouldEnable: true, width: 360.w, onTap: () {
                controller.submit(
                    successCallback: (email) => Get.toNamed(
                        AuthModulePageRoute.verifyEmail,
                        arguments: {'email': email}
                    )
                );
              })
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


