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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/common/app_color.dart';
import '../../../aitriage_core/ui/widget/base_dialog_scaffold_tablet.dart';
import '../../../aitriage_core/ui/widget/line_separated.dart';
import '../../../aitriage_module_auth/widget/drop_down_button.dart';
import '../../config/patient_module_page_route.dart';
import '../../widget/add_patient_drop_down_place_holder.dart';
import 'add_new_patient_binding.dart';
import 'add_new_patient_controller.dart';

class AddNewPatientScreen extends StatelessWidget {
  const AddNewPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddNewPatientBinding().dependencies();
    return DeviceDetector(tablet: _Tablet(), phone: _Phone());
  }
}

class _Tablet extends StatelessWidget {
  _Tablet();
  final controller = Get.find<AddNewPatientController>();

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
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Dialog Header
                Row(
                  children: [
                    Obx(() => Text(controller.vm.value.patientScreenTitle,
                        style: AppStyle.styleTextDialogHeaderTitle)),
                    const Spacer(),
                    GestureDetector(
                        onTap: () => Get.back(result: false),
                        child: SvgIconWidget(
                            name: AppImage.svgDialogClose, size: 24.w))
                  ],
                ),
                LineSeparated(
                    margin: 20.h, color: AppColor.colorInactiveFillColor),
                SizedBox(
                  height: 80.h,
                  child: Row(
                    children: [
                      Expanded(
                          child: Center(
                        child: Obx(() => CustomLoginField(
                              hintText: 'MRN*',
                              controller: controller.mrnController,
                              onTapInside: () {
                                controller.vm.value.setFirstTimeMRN();
                                controller.vm.refresh();
                              },
                              textFieldWidth: double.maxFinite,
                              textFieldHeight: 56.h,
                              onTextChange: (value) =>
                                  controller.onInfoChange(mrn: value),
                              isValidated:
                                  controller.vm.value.shouldShowMRNMessage,
                              unvalidateText: 'Please provide MRN',
                            )),
                      )),
                      SizedBox(width: 24.w),
                      Expanded(child: LayoutBuilder(
                        builder: (_, constraints) {
                          return Obx(() => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DropDownWrapper(
                                    controller:
                                        controller.nationalityController,
                                    placeHolder:
                                        const AddPatientDropDownPlaceHolder(
                                            title: 'Nationality*'),
                                    width: constraints.maxWidth,
                                    height: 56.h,
                                    dropDownHeight: 200,
                                    onTapChildren: (index) =>
                                        controller.onTapNationality(index),
                                    children: controller.vm.value.nationalities
                                        .map((e) => SizedBox(
                                            width: constraints.maxWidth,
                                            height: 50.h,
                                            child:
                                                AddPatientDropDownPlaceHolder(
                                                    title: e)))
                                        .toList(),
                                  ),
                                  Obx(() => Visibility(
                                      visible: !controller.vm.value
                                          .shouldShowNationalityMessage,
                                      child: SizedBox(
                                          height: 20.h,
                                          child: Text(
                                            'Please select your patient nationality',
                                            style: AppStyle.styleErrorText,
                                          )))),
                                ],
                              ));
                        },
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 80.h,
                  child: Row(
                    children: [
                      Expanded(
                          child: Obx(() => CustomLoginField(
                                controller: controller.patientNameController,
                                hintText: 'Patient name*',
                                textFieldWidth: double.maxFinite,
                                textFieldHeight: 56.h,
                                onTapInside: () {
                                  controller.vm.value.setFirstTimePatientName();
                                  controller.vm.refresh();
                                },
                                isValidated:
                                    controller.vm.value.shouldShowNameMessage,
                                unvalidateText: 'Please provide patient name',
                                onTextChange: (value) =>
                                    controller.onInfoChange(patientName: value),
                              ))),
                      SizedBox(width: 24.w),
                      Expanded(child: LayoutBuilder(
                        builder: (_, constraints) {
                          return Obx(() => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DropDownWrapper(
                                    controller: controller.stateController,
                                    placeHolder:
                                        const AddPatientDropDownPlaceHolder(
                                            title: 'State*'),
                                    width: constraints.maxWidth,
                                    height: 56.h,
                                    dropDownHeight: 200,
                                    onTapChildren: (index) =>
                                        controller.onTapState(index),
                                    children: controller.vm.value.states
                                        .map((e) => SizedBox(
                                            width: constraints.maxWidth,
                                            height: 50.h,
                                            child:
                                                AddPatientDropDownPlaceHolder(
                                                    title: e)))
                                        .toList(),
                                  ),
                                  Visibility(
                                      visible: !controller
                                          .vm.value.shouldShowStateMessage,
                                      child: SizedBox(
                                          height: 20.h,
                                          child: Text(
                                            'Please select your patient\'s state',
                                            style: AppStyle.styleErrorText,
                                          )))
                                ],
                              ));
                        },
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 80.h,
                  child: Row(
                    children: [
                      Expanded(
                          child: Obx(() => CustomLoginField(
                                controller: controller.dobController,
                                type: TextInputType.datetime,
                                hintText: 'dd/mm/yyyy*',
                                onTapInside: () {
                                  controller.vm.value.setFirstTimeDateOfBirth();
                                  controller.vm.refresh();
                                },
                                textInputRegex: RegExp(r'[0-9/]'),
                                textFieldWidth: double.maxFinite,
                                textFieldHeight: 56.h,
                                isValidated:
                                    controller.vm.value.shouldShowDateMessage,
                                unvalidateText:
                                    'Please provide patient\'s date of birth',
                                onTextChange: (value) =>
                                    controller.onInfoChange(dob: value),
                              ))),
                      SizedBox(width: 24.w),
                      Expanded(child: LayoutBuilder(
                        builder: (_, constraints) {
                          return Obx(() => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DropDownWrapper(
                                      controller: controller.cityController,
                                      placeHolder:
                                          const AddPatientDropDownPlaceHolder(
                                              title: 'City*'),
                                      width: constraints.maxWidth,
                                      height: 56.h,
                                      dropDownHeight: 200,
                                      shouldEnableDropDown: controller
                                          .vm.value.shouldEnableCityDropDown,
                                      onTapChildren: (index) =>
                                          controller.onTapCity(index),
                                      children: controller.vm.value.cities
                                          .map((e) => SizedBox(
                                              width: constraints.maxWidth,
                                              height: 50.h,
                                              child:
                                                  AddPatientDropDownPlaceHolder(
                                                      title: e)))
                                          .toList(),
                                    ),
                                    Visibility(
                                        visible: !controller
                                            .vm.value.shouldShowCityMessage,
                                        child: SizedBox(
                                            height: 20.h,
                                            child: Text(
                                              'Please select your patient\'s state',
                                              style: AppStyle.styleErrorText,
                                            )))
                                  ]));
                        },
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 85.h,
                  child: Row(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(child: LayoutBuilder(
                            builder: (_, constraints) {
                              return Obx(() => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DropDownWrapper(
                                        controller: controller.genderController,
                                        placeHolder:
                                            const AddPatientDropDownPlaceHolder(
                                                title: 'Gender*'),
                                        width: constraints.maxWidth,
                                        height: 56.h,
                                        dropDownHeight: 100,
                                        onTapChildren: (index) =>
                                            controller.onTapGender(index),
                                        children: controller.vm.value.genders
                                            .map((e) => SizedBox(
                                                width: constraints.maxWidth,
                                                height: 50.h,
                                                child:
                                                    AddPatientDropDownPlaceHolder(
                                                        title: e)))
                                            .toList(),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Visibility(
                                          visible: !controller
                                              .vm.value.shouldShowGenderMessage,
                                          child: SizedBox(
                                              height: 20.h,
                                              child: Text(
                                                'Please select your patient\'s gender',
                                                style: AppStyle.styleErrorText,
                                              )))
                                    ],
                                  ));
                            },
                          )),
                          SizedBox(width: 24.w),
                          Expanded(child: LayoutBuilder(
                            builder: (_, constraints) {
                              return Obx(() => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DropDownWrapper(
                                        controller: controller.raceController,
                                        placeHolder:
                                            const AddPatientDropDownPlaceHolder(
                                                title: 'Race*'),
                                        width: constraints.maxWidth,
                                        height: 56.h,
                                        dropDownHeight: 200,
                                        children: controller.vm.value.races
                                            .map((e) => SizedBox(
                                                width: constraints.maxWidth,
                                                height: 50.h,
                                                child:
                                                    AddPatientDropDownPlaceHolder(
                                                        title: e)))
                                            .toList(),
                                        onTapChildren: (index) =>
                                            controller.onTapRace(index),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Visibility(
                                          visible: !controller
                                              .vm.value.shouldShowRaceMessage,
                                          child: SizedBox(
                                              height: 20.h,
                                              child: Text(
                                                'Please select your patient\'s race',
                                                style: AppStyle.styleErrorText,
                                              )))
                                    ],
                                  ));
                            },
                          )),
                        ],
                      )),
                      SizedBox(width: 24.w),
                      Expanded(
                          child: CustomLoginField(
                        controller: controller.addressController,
                        hintText: 'Address',
                        textFieldWidth: double.maxFinite,
                        textFieldHeight: 56.h,
                        onTextChange: (value) =>
                            controller.onInfoChange(address: value),
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                SizedBox(
                  height: 155.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            CustomLoginField(
                              prefixIcon: Container(
                                width: 64.w,
                                decoration: const BoxDecoration(
                                    color: AppColor.colorBorderDisable),
                                child: Center(
                                    child: Obx(() => Text(
                                          controller.vm.value.phoneCode,
                                          style: AppStyle
                                              .styleTextColorButtonDisable,
                                        ))),
                              ),
                              controller: controller.phoneController,
                              shouldHavePrefixIcon: true,
                              type: TextInputType.number,
                              hintText: 'Phone number',
                              textFieldWidth: double.maxFinite,
                              textInputRegex: RegExp(r'[0-9]'),
                              textFieldHeight: 56.h,
                              onTextChange: (value) =>
                                  controller.onInfoChange(phone: value),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Obx(() => SizedBox(
                                  height: 80.h,
                                  child: CustomLoginField(
                                    controller: controller.emailController,
                                    hintText: 'Email',
                                    isValidated:
                                        controller.vm.value.isEmailVerify,
                                    unvalidateText:
                                        'Please provide correct email',
                                    textFieldWidth: double.maxFinite,
                                    textFieldHeight: 56.h,
                                    onTextChange: (value) =>
                                        controller.onInfoChange(email: value),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(width: 24.w),
                      Expanded(
                          child: LayoutBuilder(
                              builder: (BuildContext context,
                                      BoxConstraints constraints) =>
                                  CustomLoginField(
                                    controller:
                                        controller.descriptionController,
                                    textFieldWidth: double.maxFinite,
                                    textFieldHeight:
                                        constraints.maxHeight - 22.5,
                                    textAlignVertical: TextAlignVertical.top,
                                    maxLines: 15,
                                    hintText: 'Description',
                                    multiLineContentPadding:
                                        const EdgeInsets.only(
                                            top: 8, right: 8, bottom: 2),
                                    onTextChange: (value) => controller
                                        .onInfoChange(description: value),
                                  )))
                    ],
                  ),
                ),
                LineSeparated(
                    margin: 20.h, color: AppColor.colorInactiveFillColor),
                Row(
                  children: [
                    const Spacer(),
                    ColorButton(
                      title: 'Cancel',
                      width: 212.w,
                      height: 48.h,
                      shouldTapAbleWhenDisable: true,
                      onTap: () => Get.back(result: false),
                    ),
                    SizedBox(width: 20.w),
                    Obx(() => ColorButton(
                          shouldTapAbleWhenDisable:
                              controller.vm.value.shouldEnableSaveButton,
                          title: 'Save',
                          shouldEnableBackground:
                              controller.vm.value.shouldEnableSaveButton,
                          width: 212.w,
                          height: 48.h,
                          onTap: () {
                            onSuccess() async {
                              await Get.forceAppUpdate();
                              Get.back(result: true);
                            }

                            onError(dynamic message) {
                              Get.snackbar('Error', message);
                            }

                            controller.onTapSavePatient(
                                onSuccess: onSuccess, onError: onError);
                          },
                        ))
                  ],
                )
              ],
            ),
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
                      CustomTextField(
                          hintText: '13/06/2023',
                          rightIcon: Icon(Icons.date_range_sharp)),
                      Text('Gender'),
                      CustomTextField(
                          hintText: 'Select Gender',
                          rightIcon: Icon(Icons.arrow_drop_down)),
                      Text('Race'),
                      CustomTextField(
                          hintText: 'Select Race',
                          rightIcon: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  const Expanded(child: ColorButton(title: 'Cancel')),
                  const SizedBox(width: 5),
                  Expanded(
                      child: ColorButton(
                          title: 'Confirm',
                          shouldEnableBackground: true,
                          onTap: () {
                            Get.to(() => AlertScreen(
                                  onTapPrimaryButton: () {
                                    Get.until((route) => route.isFirst);
                                    Get.until(
                                        (route) =>
                                            route.settings.name ==
                                            PatientModulePageRoute
                                                .initialRoute,
                                        id: PatientModulePageRoute.nestedId);
                                  },
                                ));
                          }))
                ],
              ),
              const SizedBox(height: 20)
            ],
          ),
        ));
  }
}
