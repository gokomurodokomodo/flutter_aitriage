enum ParamTypeGroupType { registerAccountType, registerAccountStatus, gender }

extension ParamTypeGroupTypeX on ParamTypeGroupType {
  String get stringValue {
    switch (this) {
      case ParamTypeGroupType.registerAccountType:
        return 'REGISTER_ACCOUNT_TYPE';
      case ParamTypeGroupType.registerAccountStatus:
        return 'REGISTER_ACCOUNT_STATUS';
      case ParamTypeGroupType.gender:
        return 'GENDER';
    }
  }
}