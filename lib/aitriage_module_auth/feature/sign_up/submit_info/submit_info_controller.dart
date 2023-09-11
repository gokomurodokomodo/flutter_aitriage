import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/register_uc.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/submit_info/submit_info_validate_vm.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/submit_info/submit_info_vm.dart';
import 'package:get/get.dart';
import '../../../../aitriage_core/common/app_error.dart';
import '../../../../aitriage_core/util/crypto/crypto.dart';
import '../../../../aitriage_core/util/global_function.dart';
import '../../../data/api/request/register_request.dart';

class SubmitInfoController extends GetxController {
  final RegisterUseCase _registerUseCase;
  final vm = SubmitInfoVM();
  var text = ''.obs;
  var chooseIndex = 0.obs;
  var sercurePassword = true.obs;
  final Rx<SubmitInfoValidateVM> validateVM = SubmitInfoValidateVM().obs;

  SubmitInfoController(this._registerUseCase);

  @override
  void onInit() {
    super.onInit();
    text.value = countryList.first.emoji!;
  }


  void submit({Function(String)? successCallback}) async {
    final encryptedPassword = await CryptoUtil.encrypt(vm.password);
    final argument = Get.arguments;
    final isoCode = countryList[vm.index].iso3;
    final request = RegisterRequest(
        accountType: argument?['accountType'] ?? '',
        operatingStatus: argument?['operatingStatus'] ?? '',
        businessOwner: argument?['businessOwner'] ?? 0,
        organizationName: vm.organizationName,
        isoCode: isoCode ?? '',
        email: vm.email,
        password: encryptedPassword,
        phone: vm.phoneNumber,
        firstName: vm.firstName,
        lastName: vm.lastName,
    );

    try {
      await _registerUseCase.execute(request);
      successCallback?.call(vm.email);
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
      vm.updateVM(organizationName: organizationName);
  }

  void onFirstNameChanged(String? firstName) {
    validateVM.value.updateFirstNameValidate(firstName);
    validateVM.refresh();
    vm.updateVM(firstName: firstName);
  }

  void onLastNameChanged(String? lastName) {
    validateVM.value.updateLastNameValidate(lastName);
    validateVM.refresh();
    vm.updateVM(lastName: lastName);
  }

  void onEmailChanged(String? email) {
    validateVM.value.updateEmailValidate(email);
    validateVM.refresh();
    vm.updateVM(email: email);
  }

  void onPhoneNumberChanged(String? phoneNumber) {
    validateVM.value.updatePhoneNumberValidate(phoneNumber);
    validateVM.refresh();
    vm.updateVM(phoneNumber: phoneNumber);
  }

  void onPasswordChanged(String password) {
    validateVM.value.updatePasswordValidate(password);
    validateVM.refresh();
    vm.updateVM(password: password);
  }

  void onCountryChanged(int index) {
    chooseIndex.value = index;
    vm.updateVM(index: index);
  }


}