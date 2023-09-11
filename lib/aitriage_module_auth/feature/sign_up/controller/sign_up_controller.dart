import 'dart:ffi';

import 'package:flutter_aitriage/aitriage_core/common/app_error.dart';
import 'package:flutter_aitriage/aitriage_core/service/api_service/get_param_type/param_type.dart';
import 'package:flutter_aitriage/aitriage_core/service/api_service/get_param_type/param_type_group_type.dart';
import 'package:flutter_aitriage/aitriage_core/util/crypto/crypto.dart';
import 'package:flutter_aitriage/aitriage_core/util/global_function.dart';
import 'package:flutter_aitriage/aitriage_module_auth/data/api/request/register_request.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/register_uc.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/register_account_type/register_account_type_vm.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/submit_info/submit_info_validate_vm.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/submit_info/submit_info_vm.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/submit_info/text_controller_vm.dart';
import 'package:get/get.dart';

import '../register_account_status/register_account_status_vm.dart';

class SignUpController extends GetxController{
  final accountStatusVM = RegisterAccountStatusVM().obs;
  final accountTypeVM = RegisterAccountTypeVM().obs;
  final RegisterUseCase _registerUseCase;
  final submitInfoVM = SubmitInfoVM();
  final textControllerVM = TextControllerVM().obs;
  var text = ''.obs;
  var chooseIndex = 0.obs;
  var sercurePassword = true.obs;
  final Rx<SubmitInfoValidateVM> validateVM = SubmitInfoValidateVM().obs;
  SignUpController(this._registerUseCase);
  
  @override
  void onReady() {
    _getAccountStatusParam();
    _getAccountTypeParam();
    text.value = countryList.first.emoji!;
    super.onReady();
  }

  // Account Status
  void _getAccountStatusParam(){
    final list = paramTypes
        .where((e) => e.groupType == ParamTypeGroupType.registerAccountStatus.stringValue)
        .toList();
    _updateAccountStatusView(list: list);
  }

  void _updateAccountStatusView({
    List<ParamType>? list,
    int? buttonStatusIndex,
    int? buttonYesNoIndex,
  }) {
    accountStatusVM.value.updateVM(
      list: list,
      buttonStatusIndex: buttonStatusIndex,
      buttonYesNoIndex: buttonYesNoIndex
    );
    accountStatusVM.refresh();
  }

  void onAccountStatusTapStatusButton(int index) {
    _updateAccountStatusView(buttonStatusIndex: index);
  }

  void onAccountStatusTapYesNoButton(int index) {
    _updateAccountStatusView(buttonYesNoIndex: index);
  }

  //Account Type
  void _getAccountTypeParam() async {
    final list = paramTypes
        .where((e) => e.groupType == ParamTypeGroupType.registerAccountType.stringValue)
        .toList();
    _updateAccountTypeView(list: list);
  }

  void _updateAccountTypeView({
    List<ParamType>? list,
    int? buttonSelectedIndex
  }) {
    accountTypeVM.value.updateVM(
        list: list,
        buttonSelectedIndex: buttonSelectedIndex
    );
    accountTypeVM.refresh();
  }

  void onTapButton(int index) {
    _updateAccountTypeView(buttonSelectedIndex: index);
  }

  //submit info
  void submit({Function(String)? successCallback}) async {
    final encryptedPassword = await CryptoUtil.encrypt(submitInfoVM.password);
    final isoCode = countryList[submitInfoVM.index].iso3;
    final request = RegisterRequest(
        accountType: accountTypeVM.value.itemArgument,
        operatingStatus: accountStatusVM.value.statusArgument,
        businessOwner: accountStatusVM.value.yesNoArgument,
        organizationName: submitInfoVM.organizationName,
        isoCode: isoCode ?? '',
        email: submitInfoVM.email,
        password: encryptedPassword,
        phone: submitInfoVM.phoneNumber,
        firstName: submitInfoVM.firstName,
        lastName: submitInfoVM.lastName,
    );

    try {
      await _registerUseCase.execute(request);
      successCallback?.call(submitInfoVM.email);
    } catch (e) {
      if (e is AppError) Get.snackbar('Error', e.message);
    }
  }

   void onSwitchPassword() {
    sercurePassword.value = !sercurePassword.value;
  }

  void onOrganizationNameChanged(String? organizationName) {
    validateVM.value.updateOrganizationValidate(organizationName);
    validateVM.refresh();
    submitInfoVM.updateVM(organizationName: organizationName);
    textControllerVM.value.updateVM(organizationFieldController: organizationName);
    textControllerVM.refresh();
  }

  void onFirstNameChanged(String? firstName) {
    validateVM.value.updateFirstNameValidate(firstName);
    validateVM.refresh();
    submitInfoVM.updateVM(firstName: firstName);
    textControllerVM.value.updateVM(firstNameFieldController: firstName);
    textControllerVM.refresh();
  }

  void onLastNameChanged(String? lastName) {
    validateVM.value.updateLastNameValidate(lastName);
    validateVM.refresh();
    submitInfoVM.updateVM(lastName: lastName);
    textControllerVM.value.updateVM(lastNameFieldController: lastName);
    textControllerVM.refresh();
  }

  void onEmailChanged(String? email) {
    validateVM.value.updateEmailValidate(email);
    validateVM.refresh();
    submitInfoVM.updateVM(email: email);
    textControllerVM.value.updateVM(emailFieldController: email);
    textControllerVM.refresh();
  }

  void onPhoneNumberChanged(String? phoneNumber) {
    validateVM.value.updatePhoneNumberValidate(phoneNumber);
    validateVM.refresh();
    submitInfoVM.updateVM(phoneNumber: phoneNumber);
    textControllerVM.value.updateVM(phoneNumberFieldController: phoneNumber);
    textControllerVM.refresh();
  }

  void onPasswordChanged(String password) {
    validateVM.value.updatePasswordValidate(password);
    validateVM.refresh();
    submitInfoVM.updateVM(password: password);
    textControllerVM.value.updateVM(passwordFieldController: password);
    textControllerVM.refresh();
  }

  void onCountryChanged(int index) {
    chooseIndex.value = index;
    submitInfoVM.updateVM(index: index);
  }

}