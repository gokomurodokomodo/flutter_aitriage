import 'package:get/get.dart';

class SignInController extends GetxController{
  var isValidEmail = true.obs;
  var isValidPassword = true.obs;
  var isValidated = false.obs;
  var isCheck = false.obs;


  void onTextEmailChange(String email){
    isValidEmail.value = _validateEmail(email);
    if(isValidEmail.value && isValidPassword.value) isValidated.value = true;
  }

  void onTextPasswordChange(String password){
    isValidPassword.value = _validatePassword(password);
    if(isValidEmail.value && isValidPassword.value) isValidated.value = true;
    print(isValidated.value);
  }

  void onCheckBoxTap(bool value){
    print(value);
    isCheck.value = value;
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