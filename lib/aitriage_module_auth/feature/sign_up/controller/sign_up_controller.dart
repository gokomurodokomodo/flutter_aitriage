
import 'package:flutter_aitriage/aitriage_core/common/app_error.dart';
import 'package:flutter_aitriage/aitriage_core/service/entity/param_type.dart';
import 'package:flutter_aitriage/aitriage_core/service/service/api_service/api_service.dart';
import 'package:flutter_aitriage/aitriage_core/service/service/api_service/response/get_param_type_response.dart';
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
  final submitInfoVM = SubmitInfoVM().obs;
  final textControllerVM = TextControllerVM().obs;
  var text = ''.obs;
  var chooseIndex = 0.obs;
  var sercurePassword = true.obs;
  var shouldEnableSubmitButton = false.obs;
  var checkedTermAndPrivacy = false.obs;
  final Rx<SubmitInfoValidateVM> validateVM = SubmitInfoValidateVM().obs;
  final apiService = Get.find<ApiService>();
  SignUpController(this._registerUseCase);
  
  @override
  void onReady() {
    _getAccountStatusParam();
    _getAccountTypeParam();
    text.value = apiService.listCountry.first.emoji!;
    submitInfoVM.value.updateVM(listCountry: apiService.listCountry);
    submitInfoVM.refresh();
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
    final encryptedPassword = await CryptoUtil.encrypt(submitInfoVM.value.password);
    final isoCode = apiService.listCountry[submitInfoVM.value.index].iso3;
    final request = RegisterRequest(
        accountType: accountTypeVM.value.itemArgument,
        operatingStatus: accountStatusVM.value.statusArgument,
        businessOwner: accountStatusVM.value.yesNoArgument,
        organizationName: submitInfoVM.value.organizationName,
        isoCode: isoCode ?? '',
        email: submitInfoVM.value.email,
        password: encryptedPassword,
        phone: submitInfoVM.value.phoneNumber,
        firstName: submitInfoVM.value.firstName,
        lastName: submitInfoVM.value.lastName,
    );

    try {
      await _registerUseCase.execute(request);
      successCallback?.call(submitInfoVM.value.email);
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
    submitInfoVM.value.updateVM(organizationName: organizationName);
    submitInfoVM.refresh();
    textControllerVM.value.updateVM(organizationFieldController: organizationName);
    textControllerVM.refresh();
    _shouldEnableSubmitButton();
  }

  void onFirstNameChanged(String? firstName) {
    validateVM.value.updateFirstNameValidate(firstName);
    validateVM.refresh();
    submitInfoVM.value.updateVM(firstName: firstName);
    submitInfoVM.refresh();
    textControllerVM.value.updateVM(firstNameFieldController: firstName);
    textControllerVM.refresh();
    _shouldEnableSubmitButton();
  }

  void onLastNameChanged(String? lastName) {
    validateVM.value.updateLastNameValidate(lastName);
    validateVM.refresh();
    submitInfoVM.value.updateVM(lastName: lastName);
    submitInfoVM.refresh();
    textControllerVM.value.updateVM(lastNameFieldController: lastName);
    textControllerVM.refresh();
    _shouldEnableSubmitButton();
  }

  void onEmailChanged(String? email) {
    validateVM.value.updateEmailValidate(email);
    validateVM.refresh();
    submitInfoVM.value.updateVM(email: email);
    submitInfoVM.refresh();
    textControllerVM.value.updateVM(emailFieldController: email);
    textControllerVM.refresh();
    _shouldEnableSubmitButton();
  }

  void onPhoneNumberChanged(String? phoneNumber) {
    validateVM.value.updatePhoneNumberValidate(phoneNumber);
    validateVM.refresh();
    submitInfoVM.value.updateVM(phoneNumber: phoneNumber);
    submitInfoVM.refresh();
    textControllerVM.value.updateVM(phoneNumberFieldController: phoneNumber);
    textControllerVM.refresh();
    _shouldEnableSubmitButton();
  }

  void onPasswordChanged(String password) {
    validateVM.value.updatePasswordValidate(password);
    validateVM.refresh();
    submitInfoVM.value.updateVM(password: password);
    submitInfoVM.refresh();
    textControllerVM.value.updateVM(passwordFieldController: password);
    textControllerVM.refresh();
    _shouldEnableSubmitButton();
  }

  void onCountryChanged(int index) {
    chooseIndex.value = index;
    print(chooseIndex.value);
    submitInfoVM.value.updateVM(index: index);
    submitInfoVM.refresh();
    _shouldEnableSubmitButton();
  }

  void onTapTermAndPrivacyCheckBox(bool isChecked){
    checkedTermAndPrivacy.value = isChecked;
    _shouldEnableSubmitButton();
  }

  void _shouldEnableSubmitButton(){
    if(validateVM.value.isAllValidated && checkedTermAndPrivacy.value){
      shouldEnableSubmitButton.value = true;
    } else {
      shouldEnableSubmitButton.value = false;
    }
  }

}