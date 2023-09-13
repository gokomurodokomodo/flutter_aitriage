import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/color_button.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_login_field.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/controller/sign_up_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../aitriage_core/common/app_color.dart';
import '../../../../aitriage_core/common/app_style.dart';
import '../../../config/auth_module_page_route.dart';
import '../../../widget/agree_term_and_privacy_policy_checkbox.dart';
import '../../../widget/auth_back_button.dart';
import '../../../widget/step_count_widget.dart';

class SubmitInfoScreen extends StatelessWidget {
  const SubmitInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  DeviceDetector(tablet: _Tablet(), phone: _Phone());
  }
}

class _Tablet extends StatelessWidget {
  _Tablet();
  final SignUpController controller = Get.find();


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
              Text('please_add_information'.tr,
                  style: AppStyle.styleCheckYourEmailNotification),
              SizedBox(height: 24.h),
              Obx(() => Center(
                    child: CustomLoginField(
                      shouldAddBorder: true,
                      enableBorder: !controller.validateVM.value.isOrganizationValidate,
                      label: 'organization_name'.tr,
                      enableLabelAsterisk: true,
                      hintText: 'organization_name'.tr,
                      controller: controller
                          .textControllerVM.value.organizationFieldController,
                      onTapOutside: () {
                        controller.onOrganizationNameChanged(
                            controller.submitInfoVM.value.organizationName);
                      },
                      onTapInside:()=> controller.validateVM.value.updateFirstTimeOrganization(false),
                      onTextChange: (value) =>
                          controller.onOrganizationNameChanged(value),
                      isValidated:
                          controller.validateVM.value.isOrganizationValidate,
                      unvalidateText: 'un_validated_organization'.tr,
                    ),
                  )),
              SizedBox(height: 10.h),
              DropDownButton(
                    chooseIndex: controller.chooseIndex.value,
                    title: 'country'.tr,
                    shouldIncludeAsterisk: true,
                    dropDownWidth: 360.w,
                    onTapChildren: (index) =>
                        controller.onCountryChanged(index),
                    children: controller.listCountry
                        .map((e) => Obx(() =>CountryWidget(
                              isNetworkIcon: true,
                              leftIconName: e.emoji,
                              contentText: e.name,
                              isChoosed: e.name ==
                                  controller.listCountry[controller.chooseIndex.value]
                                      .name,
                            )))
                        .toList(),
                  ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 110.h,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(() => CustomLoginField(
                          shouldAddBorder: true,
                          enableBorder: !controller.validateVM.value.isFirstNameValidate,
                          label: 'first_name'.tr,
                          enableLabelAsterisk: true,
                          hintText: 'first_name'.tr,
                          textFieldWidth: 170.w,
                          controller: controller
                              .textControllerVM.value.firstNameFieldController,
                          onTapInside: () => controller.validateVM.value.updateFirstTimeFirstName(false),
                          onTapOutside: () {
                            controller.onFirstNameChanged(
                                controller.submitInfoVM.value.firstName);
                          },
                          onTextChange: (value) =>
                              controller.onFirstNameChanged(value),
                          isValidated:
                              controller.validateVM.value.isFirstNameValidate,
                          unvalidateText: 'un_validated_first_name'.tr,
                        )),
                    SizedBox(width: 20.w),
                    Obx(() => CustomLoginField(
                          shouldAddBorder: true,
                          enableBorder: !controller.validateVM.value.isLastNameValidate,
                          label: 'last_name'.tr,
                          enableLabelAsterisk: true,
                          hintText: 'last_name'.tr,
                          controller: controller
                              .textControllerVM.value.lastNameFieldController,
                          textFieldWidth: 170.w,
                          onTapOutside: () => controller.onLastNameChanged(
                              controller.submitInfoVM.value.lastName),
                          onTapInside: () => controller.validateVM.value.updateFirstTimeLastName(false),
                          onTextChange: (value) =>
                              controller.onLastNameChanged(value),
                          isValidated:
                              controller.validateVM.value.isLastNameValidate,
                          unvalidateText: 'un_validated_last_name'.tr,
                        )),
                  ],
                ),
              ),
              Obx(() => Center(
                    child: CustomLoginField(
                      shouldAddBorder: true,
                      enableBorder: !controller.validateVM.value.isEmailValidate,
                      label: 'email'.tr,
                      enableLabelAsterisk: true,
                      hintText: 'email_placeholder'.tr,
                      controller: controller
                          .textControllerVM.value.emailFieldController,
                      onTapInside: () => controller.validateVM.value.updateFirstTimeEmail(false),
                      onTapOutside: () => controller
                          .onEmailChanged(controller.submitInfoVM.value.email),
                      onTextChange: (value) => controller.onEmailChanged(value),
                      isValidated: controller.validateVM.value.isEmailValidate,
                      unvalidateText: 'un_validated_email'.tr,
                    ),
                  )),
              SizedBox(height: 20.h),
              Obx(() => Center(
                    child: CustomLoginField(
                      shouldAddBorder: true,
                      enableBorder: !controller.validateVM.value.isPhoneNumberValidate,
                      type: const TextInputType.numberWithOptions(),
                      label: 'phone_number'.tr,
                      enableLabelAsterisk: true,
                      controller: controller
                          .textControllerVM.value.phoneNumberFieldController,
                      hintText: 'phone_number_placeholder'.tr,
                      onTapInside: () => controller.validateVM.value.updateFirstTimePhoneNumber(false),
                      onTapOutside: () => controller.onPhoneNumberChanged(
                          controller.submitInfoVM.value.phoneNumber),
                      onTextChange: (value) =>
                          controller.onPhoneNumberChanged(value),
                      isValidated:
                          controller.validateVM.value.isPhoneNumberValidate,
                      unvalidateText: 'un_validated_phone_number'.tr,
                      textInputFormatter: RegExp('[0-9]'),
                    ),
                  )),
              SizedBox(height: 20.h),
              Obx(() => Center(
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        SizedBox(
                          width: 360.w,
                          child: CustomLoginField(
                            shouldAddBorder: true,
                            enableBorder: !controller.validateVM.value.isPasswordValidate,
                            onTapInside: () => controller.validateVM.value.updateFirstTimePassword(false),
                            shouldHaveTrailingIcon: true,
                            controller: controller
                                .textControllerVM.value.passwordFieldController,
                            label: 'password'.tr,
                            labelStyle: AppStyle.styleTextButtonBackToLogin,
                            enableLabelAsterisk: true,
                            hintText: 'password_placeholder'.tr,
                            onTapOutside: () => controller.onPasswordChanged(
                                controller.submitInfoVM.value.password),
                            onTextChange: (value) =>
                                controller.onPasswordChanged(value),
                            isValidated:
                                controller.validateVM.value.isPasswordValidate,
                            unvalidateText: 'un_validated_password'.tr,
                            shouldSecured: controller.sercurePassword.value,
                            onSwitchPasswordView: controller.onSwitchPassword,
                            sercurePassword: controller.sercurePassword.value,
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: 20.h),
              Obx(() => AgreeTermAndPrivacyPolicyCheckbox(
                    termUrl: controller.apiService.termUrl,
                    privacyUrl: controller.apiService.privacyUrl,
                    passedValue: controller.checkedTermAndPrivacy.value,
                    width: 360.w,
                    onTap: (_) => controller.onTapTermAndPrivacyCheckBox(_),
                  )),
              SizedBox(height: 32.h),
              Obx(() => ColorButton(
                  title: 'submit'.tr,
                  shouldEnable: controller.shouldEnableSubmitButton.value,
                  width: 360.w,
                  onTap: () {
                    controller.submit(
                        successCallback: (email) => Get.toNamed(
                            AuthModulePageRoute.verifyEmail,
                            arguments: {'email': email}));
                  }))
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
    return const Placeholder();
  }
}
