import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/register_uc.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/submit_info/submit_info_validate_vm.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/submit_info/submit_info_vm.dart';
import 'package:get/get.dart';
import '../../../../aitriage_core/common/app_error.dart';
import '../../../../aitriage_core/service/hivi_service/hivi_service.dart';
import '../../../../aitriage_core/util/crypto/crypto.dart';
import '../../../data/api/request/register_request.dart';

class SubmitInfoController extends GetxController {
  final RegisterUseCase _registerUseCase;
  final vm = SubmitInfoVM().obs;
  var text = ''.obs;
  var chooseIndex = 0.obs;
  var securePassword = true.obs;
  final Rx<SubmitInfoValidateVM> validateVM = SubmitInfoValidateVM().obs;

  SubmitInfoController(this._registerUseCase);

  @override
  void onInit() {
    super.onInit();
    final hiviService = HiviService.instance;
    vm.value.updateVM(listCountry: hiviService.countries);
    text.value = vm.value.listCountry.first.emoji!;
    vm.refresh();
  }


  void submit({Function(String)? successCallback}) async {
    final encryptedPassword = await CryptoUtil.encrypt(vm.value.password);
    final argument = Get.arguments;
    final isoCode = vm.value.listCountry[vm.value.index].iso3;
    final request = RegisterRequest(
        accountType: argument?['accountType'] ?? '',
        operatingStatus: argument?['operatingStatus'] ?? '',
        businessOwner: argument?['businessOwner'] ?? 0,
        organizationName: vm.value.organizationName,
        isoCode: isoCode ?? '',
        email: vm.value.email,
        password: encryptedPassword,
        phone: vm.value.phoneNumber,
        firstName: vm.value.firstName,
        lastName: vm.value.lastName,
    );

    try {
      await _registerUseCase.execute(request);
      successCallback?.call(vm.value.email);
    } catch (e) {
      if (e is AppError) Get.snackbar('Error', e.message);
    }
  }

  
  void onSwitchPassword() {
    securePassword.value = !securePassword.value;
  }

  void onOrganizationNameChanged(String? organizationName) {
    vm.value.updateVM(organizationName: organizationName);
  }

  void onFirstNameChanged(String? firstName) {
    vm.value.updateVM(firstName: firstName);
  }

  void onLastNameChanged(String? lastName) {
    vm.value.updateVM(lastName: lastName);
  }

  void onEmailChanged(String? email) {
    vm.value.updateVM(email: email);
  }

  void onPhoneNumberChanged(String? phoneNumber) {
    vm.value.updateVM(phoneNumber: phoneNumber);
  }

  void onPasswordChanged(String password) {
    vm.value.updateVM(password: password);
  }

  void onCountryChanged(int index) {
    chooseIndex.value = index;
    vm.value.updateVM(index: index);
  }


}