class SubmitInfoValidateVM{
  bool _isOrganizationValidate = true;
  bool _isFirstNameValidate = true;
  bool _isLastNameValidate = true;
  bool _isEmailValidate = true;
  bool _isPhoneNumberValidate = true;
  bool _isPasswordValidate = true;

  bool _isFirstTimeOrganization = true;
  bool _isFirstTimeFirstName = true;
  bool _isFirstTimeLastName = true;
  bool _isFirstTimeEmail = true;
  bool _isFirstTimePhoneNumber = true;
  bool _isFirstTimePassword = true;

  RegExp emailReg = RegExp(
      r'^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,7}$',
    );
  final RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Z])[A-Za-z0-9]{8,}$',
    );

    void updateOrganizationValidate(String? isOrganizationValidate){
      _isOrganizationValidate = _validateNotRegrex(isOrganizationValidate) || _isFirstTimeOrganization;
    }

    void updateFirstNameValidate(String? isFirstNameValidate){
      _isFirstNameValidate = _validateNotRegrex(isFirstNameValidate) || _isFirstTimeFirstName;
    }

    void updateEmailValidate(String? isEmailValidate){
      _isEmailValidate = _validateWithRegrex(isEmailValidate, emailReg) || _isFirstTimeEmail;
    }

    void updateLastNameValidate(String? isLastNameValidate){
      _isLastNameValidate = _validateNotRegrex(isLastNameValidate) || _isFirstTimeLastName;
    }

    void updatePhoneNumberValidate(String? isPhoneNumberValidate){
      _isPhoneNumberValidate = _validateNotRegrex(isPhoneNumberValidate) || _isFirstTimePhoneNumber;
    }

    void updatePasswordValidate(String? isPasswordValidate){
      _isPasswordValidate = _validateWithRegrex(isPasswordValidate, passwordRegex, isPasswordValidate: true) || _isFirstTimePassword;
    }

    void updateFirstTimeOrganization(bool isFirstTime){
      _isFirstTimeOrganization = isFirstTime;
    }

    void updateFirstTimeFirstName(bool isFirstTime){
      _isFirstTimeFirstName = isFirstTime;
    }

    void updateFirstTimeLastName(bool isFirstTime){
      _isFirstTimeLastName = isFirstTime;
    }

    void updateFirstTimeEmail(bool isFirstTime){
      _isFirstTimeEmail = isFirstTime;
    }

    void updateFirstTimePhoneNumber(bool isFirstTime){
      _isFirstTimePhoneNumber = isFirstTime;
    }

    void updateFirstTimePassword(bool isFirstTime){
      _isFirstTimePassword = isFirstTime;
    }

  bool get isOrganizationValidate => _isOrganizationValidate;
  bool get isFirstNameValidate => _isFirstNameValidate;
  bool get isLastNameValidate => _isLastNameValidate;
  bool get isEmailValidate => _isEmailValidate;
  bool get isPhoneNumberValidate => _isPhoneNumberValidate;
  bool get isPasswordValidate => _isPasswordValidate;
  bool get isAllValidated {
    return ((_isOrganizationValidate) 
    && (_isEmailValidate) 
    && (_isFirstNameValidate)
    && (_isLastNameValidate)
    && (_isPasswordValidate)
    &&(_isPhoneNumberValidate)) ? true : false;
  }

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
  
  bool _validateWithRegrex(String? information, RegExp regrex, {bool isPasswordValidate = false}){
    
    if(information == null){
      return false;
    } else {
      if(isPasswordValidate){
        if(information.contains(RegExp(r'[!@#$%^&*()?":{}|<>]'))) {
          return true;
        }
      }
      return regrex.hasMatch(information) ? true : false;
    }
  }
}