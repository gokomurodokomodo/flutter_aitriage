import 'package:get/get.dart';

class SignInController extends GetxController{
  var isValidEmail = false.obs;
  var isValidPassword = false.obs;
  var isValidated = false.obs;
  var isCheck = false.obs;


  void onTextEmailChange(String email){
    isValidEmail.value = _validateEmail(email);
    _validate();
  }

  void onTextPasswordChange(String password){
    isValidPassword.value = _validatePassword(password);
    _validate();
  }

  void onCheckBoxTap(bool value){
    isCheck.value = value;
    _validate();
  }

  void _validate(){
    if(isValidEmail.value && isValidPassword.value && isCheck.value) {
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