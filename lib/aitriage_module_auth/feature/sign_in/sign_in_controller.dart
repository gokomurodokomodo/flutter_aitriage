import 'package:flutter_aitriage/aitriage_core/common/app_error.dart';
import 'package:flutter_aitriage/aitriage_core/util/alert/alert_util.dart';
import 'package:flutter_aitriage/aitriage_core/util/network_check/network_check_util.dart';
import 'package:flutter_aitriage/aitriage_module_auth/config/auth_module_page_route.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/sign_in_uc.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_in/sign_in_vm.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/entity/user_info.dart';
import '../../../aitriage_core/network/handle_error/handle_error.dart';
import '../../../aitriage_core/service/hivi_service/hivi_service.dart';

class SignInController extends GetxController{
  final vm = SignInVM().obs;
  var isValidEmail = false.obs;
  var isValidPassword = false.obs;
  var isValidated = false.obs;
  var isCheck = false.obs;
  final SignInUseCaseImpl _useCase;
  final hiviService = Get.find<HiviService>();

  SignInController(this._useCase);

  @override
  void onInit() {
    super.onInit();
    vm.value.updateVM(countryList: hiviService.listCountry);
    vm.refresh();
  }

  void onSubmitSignIn({
    Function(UserInfo)? callback
  }) async{
    try {
      final checkNetwork = await NetworkCheckUtil().isConnectedToInternet();
      AlertUtil.showLoadingIndicator();
      late UserInfo userInfo;
      final request = await vm.value.signInRequest;

      if (checkNetwork) {
        userInfo = await _useCase.onlineSignIn(request);
      } else {

      }
      Get.back();
      callback?.call(userInfo);
    } catch (e) {
      Get.back();
      HandleNetworkError.handleNetworkError(e, (message, _, __) => Get.snackbar('Error', message));
    }
  }

  void onTextEmailChange(String email){
    isValidEmail.value = _validateEmail(email);
    if(isValidEmail.value) vm.value.updateVM(username: email);
    _validate();
  }

  void onTextPasswordChange(String password){
    isValidPassword.value = _validatePassword(password);
    if(isValidPassword.value) vm.value.updateVM(password: password);
    _validate();
  }

  void onCheckBoxTap(bool value){
    isCheck.value = value;
    _validate();
  }

  void _validate(){
    if(isValidEmail.value && isValidPassword.value) {
      isValidated.value = true;
    } else {
      isValidated.value = false;
    }
  }

  bool _validateEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,7}$',
    );
    return emailRegex.hasMatch(email);
  }

  bool _validatePassword(String password){
    final RegExp passwordRegex = RegExp(
      r'^(?=.*[!@#\$%^&*(),.?":{}|<>])(?=.*[0-9]).{8,}$',
    );
    return passwordRegex.hasMatch(password);
  }

  void _handleError(dynamic e){
    if (e is! AppError){
      return;
    } else {
      if(e.statusMessage == HandleNetworkError.requestVerifiedEmail){
        _useCase.genCodeForSignIn(vm.value.username);
        Get.toNamed(AuthModulePageRoute.verifyEmail, arguments: {
          'userName' : vm.value.username,
          'password': vm.value.password
        });
      } else{
        HandleNetworkError.handleNetworkError(e, (message, _, __) => Get.snackbar('Error', message));
      }
    }
  }
}