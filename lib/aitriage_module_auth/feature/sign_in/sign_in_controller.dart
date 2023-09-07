import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_constant.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_error.dart';
import 'package:flutter_aitriage/aitriage_core/service/api_service/api_service.dart';
import 'package:flutter_aitriage/aitriage_core/service/api_service/get_user_info/user_info.dart';
import 'package:flutter_aitriage/aitriage_core/util/alert/alert_util.dart';
import 'package:flutter_aitriage/aitriage_core/util/crypto/crypto.dart';
import 'package:flutter_aitriage/aitriage_core/util/global_function.dart';
import 'package:flutter_aitriage/aitriage_core/util/network_check/network_check_util.dart';
import 'package:flutter_aitriage/aitriage_module_auth/config/auth_module_page_route.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/entity/user_param.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/sign_in_uc.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_in/sign_in_vm.dart';
import 'package:flutter_aitriage/aitriage_module_main/config/main_route.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/network/handle_error/handle_error.dart';
import '../../../aitriage_core/service/local_storage_service/local_storage_service.dart';

class SignInController extends GetxController{
  final _vm = SignInVM();
  var isValidEmail = false.obs;
  var isValidPassword = false.obs;
  var isValidated = false.obs;
  var isCheck = false.obs;
  final SignInUseCaseImpl _useCase;

  SignInController(this._useCase);

  void onSubmitSignIn({
    Function(UserInfo)? callback
  }) async{
    try {
      final checkNetwork = await NetworkCheckUtil().isConnectedToInternet();
      AlertUtil.showLoadingIndicator();
      late UserInfo userInfo;

      if (checkNetwork) {
        final apiService = Get.find<ApiService>();
        final result = await _useCase.execute(await _vm.signInRequest);
        final resp = await apiService.getUserInfoUseCase.execute(result.data.id ?? 0);
        final password = _vm.password;
        final key = '${AppConstant.preCharSaveUserData}${_vm.username}';
        LocalStorageService().setSecuredUser(userName: _vm.username, password: password);
        LocalStorageService().setSecuredUserData(key: key, data: result.data);
        LocalStorageService().removeSecured(key: AppConstant.firstDateOffline);
        LocalStorageService().setCurrentAccessToken(accessToken: result.data.accessToken ?? '');
        userInfo = resp.data;
      } else {
        final password = _vm.password;
        final key = '${AppConstant.preCharSaveUserData}${_vm.username}';
        if(password == await LocalStorageService().getSecuredUserPassword(userName: _vm.username)){
          final timePast = (DateTime.now().difference(await LocalStorageService().getFirstDateOffline())).inDays;
          if(timePast > 7) {
            Get.dialog(AlertDialog(title: Text('Expired 7 Day'),));
          } else {
            final result = await LocalStorageService().getUserData(key: key);
            LocalStorageService().setFirstDateOffline();
            LocalStorageService().setCurrentAccessToken(accessToken: result.accessToken ?? '');
            // temp value
            userInfo = UserInfo.fromJson(null);
          }
        }
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
    if(isValidEmail.value) _vm.updateVM(username: email);
    _validate();
  }

  void onTextPasswordChange(String password){
    isValidPassword.value = _validatePassword(password);
    if(isValidPassword.value) _vm.updateVM(password: password);
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
        _useCase.genCodeForSignIn(_vm.username);
        Get.toNamed(AuthModulePageRoute.verifyEmail, arguments: {
          'userName' : _vm.username,
          'password': _vm.password
        });
      } else{
        HandleNetworkError.handleNetworkError(e, (message, _, __) => Get.snackbar('Error', message));
      }
    }
  }
}