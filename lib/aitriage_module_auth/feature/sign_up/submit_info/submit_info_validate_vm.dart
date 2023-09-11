class SubmitInfoValidateVM{
  bool _isOrganizationValidate = true;
  bool _isFirstNameValidate = true;
  bool _isLastNameValidate = true;
  bool _isEmailValidate = true;
  bool _isPhoneNumberValidate = true;
  bool _isPasswordValidate = true;
  RegExp emailReg = RegExp(
      r'^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,7}$',
    );
  final RegExp passwordRegex = RegExp(
      r'^(?=.*[!@#\$%^&*(),.?":{}|<>])(?=.*[0-9]).{8,}$',
    );

    void updateOrganizationValidate(String? isOrganizationValidate){
      _isOrganizationValidate = _validateNotRegrex(isOrganizationValidate);
    }

    void updateFirstNameValidate(String? isFirstNameValidate){
      _isFirstNameValidate = _validateNotRegrex(isFirstNameValidate);
    }

    void updateEmailValidate(String? isEmailValidate){
      _isEmailValidate = _validateWithRegrex(isEmailValidate, emailReg);
    }

    void updateLastNameValidate(String? isLastNameValidate){
      _isLastNameValidate = _validateNotRegrex(isLastNameValidate);
    }

    void updatePhoneNumberValidate(String? isPhoneNumberValidate){
      _isPhoneNumberValidate = _validateNotRegrex(isPhoneNumberValidate);
    }

    void updatePasswordValidate(String? isPasswordValidate){
      _isPasswordValidate = _validateWithRegrex(isPasswordValidate, passwordRegex);
    }

  bool get isOrganizationValidate => _isOrganizationValidate;
  bool get isFirstNameValidate => _isFirstNameValidate;
  bool get isLastNameValidate => _isLastNameValidate;
  bool get isEmailValidate => _isEmailValidate;
  bool get isPhoneNumberValidate => _isPhoneNumberValidate;
  bool get isPasswordValidate => _isPasswordValidate;

  bool _validateNotRegrex(String? information){
    if(information == null){
      return true;
    } else {
      if(information == ''){
        return false;
      } else {
        return true;
      }
    }
  }
  
  bool _validateWithRegrex(String? information, RegExp regrex){
    if(information == null){
      return true;
    } else {
      return regrex.hasMatch(information) ? true : false;
    }
  }
}