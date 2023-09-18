import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/screen/alert_screen.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/color_button.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_login_field.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_text_field.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/add_new_patient/add_new_patient_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/common/app_color.dart';
import '../../../aitriage_core/ui/widget/base_dialog_scaffold_tablet.dart';
import '../../../aitriage_core/ui/widget/line_separated.dart';
import '../../../aitriage_module_auth/widget/drop_down_button.dart';
import '../../config/assessment_module_page_route.dart';
import '../../widget/add_patient_drop_down_place_holder.dart';

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

class _Tablet extends GetView<AddNewPatientController> {
  const _Tablet();

  @override
  Widget build(BuildContext context) {
    return BaseDialogScaffoldTablet(
      body: Center(
        child: Container(
          width: 960.w,
          // height: 700.h,
          padding: EdgeInsets.all(24.r),
          decoration: BoxDecoration(
            color: AppColor.colorAppBackground,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                  Expanded(child: CustomLoginField(hintText: 'MRN*', textFieldWidth: double.maxFinite, textFieldHeight: 56.h)),
                  SizedBox(width: 24.w),
                  Expanded(
                      child: LayoutBuilder(
                        builder: (_, constraints) {
                          return Obx(() => DropDownButton(
                            placeHolder: const AddPatientDropDownPlaceHolder(title: 'Nationality*'),
                            width: constraints.maxWidth,
                            height: 56.h,
                            dropDownHeight: 200,
                            children: controller.vm.value.nationalities.map((e) => SizedBox(
                                width: constraints.maxWidth,
                                height: 50.h,
                                child: AddPatientDropDownPlaceHolder(title: e))).toList(),
                          ));
                        },
                      )
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(child: CustomLoginField(hintText: 'Patient name*', textFieldWidth: double.maxFinite, textFieldHeight: 56.h)),
                  SizedBox(width: 24.w),
                  Expanded(
                      child: LayoutBuilder(
                        builder: (_, constraints) {
                          return Obx(() => DropDownButton(
                            placeHolder: const AddPatientDropDownPlaceHolder(title: 'State*'),
                            width: constraints.maxWidth,
                            height: 56.h,
                            dropDownHeight: 200,
                            children: controller.vm.value.states.map((e) => SizedBox(
                                width: constraints.maxWidth,
                                height: 50.h,
                                child: AddPatientDropDownPlaceHolder(title: e))).toList(),
                          ));
                        },
                      )
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(child: CustomLoginField(
                      type: TextInputType.datetime,
                      textInputFormatter: DateTextFormatter(),
                      hintText: 'dd/mm/yyyy*',
                      textFieldWidth: double.maxFinite,
                      textFieldHeight: 56.h)),
                  SizedBox(width: 24.w),
                  Expanded(
                      child: LayoutBuilder(
                        builder: (_, constraints) {
                          return Obx(() => DropDownButton(
                            placeHolder: const AddPatientDropDownPlaceHolder(title: 'City*'),
                            width: constraints.maxWidth,
                            height: 56.h,
                            dropDownHeight: 200,
                            children: controller.vm.value.cities.map((e) => SizedBox(
                                width: constraints.maxWidth,
                                height: 50.h,
                                child: AddPatientDropDownPlaceHolder(title: e))).toList(),
                          ));
                        },
                      )
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                      child: Row(
                        children: [
                          Expanded(
                              child: LayoutBuilder(
                                builder: (_, constraints) {
                                  return Obx(() => DropDownButton(
                                    placeHolder: const AddPatientDropDownPlaceHolder(title: 'Gender*'),
                                    width: constraints.maxWidth,
                                    height: 56.h,
                                    dropDownHeight: 100,
                                    children: controller.vm.value.genders.map((e) => SizedBox(
                                        width: constraints.maxWidth,
                                        height: 50.h,
                                        child: AddPatientDropDownPlaceHolder(title: e))).toList(),
                                  ));
                                },
                              )
                          ),
                          SizedBox(width: 24.w),
                          Expanded(
                              child: LayoutBuilder(
                                builder: (_, constraints) {
                                  return Obx(() => DropDownButton(
                                    placeHolder: const AddPatientDropDownPlaceHolder(title: 'Race*'),
                                    width: constraints.maxWidth,
                                    height: 56.h,
                                    children: controller.vm.value.races.map((e) => SizedBox(
                                        width: constraints.maxWidth,
                                        height: 50.h,
                                        child: AddPatientDropDownPlaceHolder(title: e))).toList(),
                                  ));
                                },
                              )
                          ),
                        ],
                      )),
                  SizedBox(width: 24.w),
                  Expanded(child: CustomLoginField(hintText: 'Address', textFieldWidth: double.maxFinite, textFieldHeight: 56.h)),
                ],
              ),
              SizedBox(height: 24.h),
              SizedBox(
                height: 136.h,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          CustomLoginField(hintText: 'Phone number', textFieldWidth: double.maxFinite, textFieldHeight: 56.h),
                          const Spacer(),
                          CustomLoginField(hintText: 'Email', textFieldWidth: double.maxFinite, textFieldHeight: 56.h),
                        ],
                      ),
                    ),
                    SizedBox(width: 24.w),
                    Expanded(
                        child: LayoutBuilder(
                          builder: (BuildContext context, BoxConstraints constraints) =>  CustomLoginField(
                            textFieldWidth: double.maxFinite,
                            textFieldHeight: constraints.maxHeight - 2.5,
                            hintText: 'Description',
                          )))
                  ],
                ),
              ),
              LineSeparated(margin: 20.h, color: AppColor.colorInactiveFillColor),
              Row(
                children: [
                  const Spacer(),
                  ColorButton(title: 'Cancel', width: 212.w, height: 48.h),
                  SizedBox(width: 20.w),
                  ColorButton(
                      title: 'Save',
                      shouldEnable: true,
                      width: 212.w,
                      height: 48.h,
                      onTap: () => controller.addPatient(),
                  )
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
                          Get.until((route) => route.settings.name == AssessmentModulePageRoute.initialRoute, id: AssessmentModulePageRoute.nestedId);
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

class DateTextFormatter extends TextInputFormatter {
  static const _maxChars = 8;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = _format(newValue.text, '/');
    return newValue.copyWith(text: text, selection: updateCursorPosition(text));
  }

  String _format(String value, String seperator) {
    value = value.replaceAll(seperator, '');
    var newString = '';

    for (int i = 0; i < min(value.length, _maxChars); i++) {
      newString += value[i];
      if ((i == 1 || i == 3) && i != value.length - 1) {
        newString += seperator;
      }
    }

    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}
