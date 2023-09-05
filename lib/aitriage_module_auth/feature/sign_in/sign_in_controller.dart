import 'package:flutter/foundation.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_error.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/sign_in_uc.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_in/sign_in_vm.dart';
import 'package:get/get.dart';

import '../../../aitriage_core/network/handle_error/handle_error.dart';

class SignInController extends GetxController{
  final _vm = SignInVM();
  var isValidEmail = false.obs;
  var isValidPassword = false.obs;
  var isValidated = false.obs;
  var isCheck = false.obs;
  final SignInUseCaseImpl _useCase;

  SignInController(this._useCase);

  void onSubmitSignIn() async{
    try{
      final result = await _useCase.execute(await _vm.signInRequest);
    } catch(e){
      HandleNetworkError.handleNetworkError(e , (message) {
        print((e as AppError).body['data']);
        if(message == '') {
          return;
        } else{
          Get.snackbar('Error', message);
        }
      });
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


}