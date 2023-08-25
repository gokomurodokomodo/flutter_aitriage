import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/screen/alert_screen.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/color_button.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_login_field.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_text_field.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../aitriage_core/common/app_color.dart';
import '../../../aitriage_core/ui/widget/base_dialog_scaffold_tablet.dart';
import '../../../aitriage_core/ui/widget/line_separated.dart';
import '../../../aitriage_module_auth/widget/drop_down_button.dart';
import '../../config/assessment_route.dart';

class AddNewPatientScreen extends StatelessWidget {
  const AddNewPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _Tablet(),
        phone: _Phone()
    );
  }
}

class _Tablet extends StatelessWidget {
  const _Tablet();

  @override
  Widget build(BuildContext context) {
    return BaseDialogScaffoldTablet(
      body: Center(
        child: Container(
          width: 960.w,
          height: 656.h,
          padding: EdgeInsets.all(24.r),
          decoration: BoxDecoration(
            color: AppColor.colorAppBackground,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            children: [
              // Dialog Header
              Row(
                children: [
                  Text('ADD PATIENT', style: AppStyle.styleTextDialogHeaderTitle),
                  const Spacer(),
                  GestureDetector(
                      onTap: () => Get.back(),
                      child: SvgIconWidget(name: AppImage.svgDialogClose, size: 24.r))
                ],
              ),
              LineSeparated(margin: 20.h, color: AppColor.colorInactiveFillColor),
              Row(
                children: [
                  Expanded(child: CustomLoginField(hintText: 'MRN*', textFieldWidth: double.infinity)),
                  SizedBox(width: 24.w),
                  Expanded(child: DropDownButton(contentText: 'Nationality*', dropDownWidth: double.infinity)),
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(child: CustomLoginField(hintText: 'Patient name*', textFieldWidth: double.infinity)),
                  SizedBox(width: 24.w),
                  Expanded(child: DropDownButton(contentText: 'State*', dropDownWidth: double.infinity)),
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(child: CustomLoginField(hintText: 'dd/mm/yyyy*', textFieldWidth: double.infinity)),
                  SizedBox(width: 24.w),
                  Expanded(child: DropDownButton(contentText: 'City*', dropDownWidth: double.infinity)),
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(child: Row(
                    children: [
                      Expanded(child: DropDownButton(contentText: 'Gender*', dropDownWidth: double.infinity)),
                      SizedBox(width: 24.w),
                      Expanded(child: DropDownButton(contentText: 'Race*', dropDownWidth: double.infinity)),
                    ],
                  )),
                  SizedBox(width: 24.w),
                  Expanded(child: CustomLoginField(hintText: 'Address', textFieldWidth: double.infinity)),
                ],
              ),
              SizedBox(height: 24.h),

            ],
          ),
        ),
      ),
    );
  }
}

class _Phone extends StatelessWidget {
  const _Phone();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorAppBackground,
      appBar: AppBar(
        title: const Text('ADD NEW PATIENT'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('MRN'),
                    CustomTextField(hintText: 'Patient999'),
                    Text('Patient name'),
                    CustomTextField(hintText: 'Patient name'),
                    Text('Phone number'),
                    CustomTextField(hintText: 'Phone number'),
                    Text('Email'),
                    CustomTextField(hintText: 'Email'),
                    Text('Date of Birth'),
                    CustomTextField(hintText: '13/06/2023', rightIcon: Icon(Icons.date_range_sharp)),
                    Text('Gender'),
                    CustomTextField(hintText: 'Select Gender', rightIcon: Icon(Icons.arrow_drop_down)),
                    Text('Race'),
                    CustomTextField(hintText: 'Select Race', rightIcon: Icon(Icons.arrow_drop_down)),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                const Expanded(child: ColorButton(title: 'Cancel')),
                const SizedBox(width: 5),
                Expanded(child: ColorButton(
                  title: 'Confirm',
                  shouldEnable: true,
                  onTap: () {

                    Get.to(() => AlertScreen(
                        onTapPrimaryButton: () {
                          Get.until((route) => route.isFirst);
                          Get.until((route) => route.settings.name == AssessmentRoute.initialRoute, id: AssessmentRoute.nestedId);
                          },
                    ));
                  }))
              ],
            ),
            const SizedBox(height: 20)
          ],
        ),
      )
    );
  }
}


