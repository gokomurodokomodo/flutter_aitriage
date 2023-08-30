import 'package:flutter_aitriage/aitriage_core/network/base_query.dart';

enum RegisterAccountQueryEnum { registerAccountType, registerAccountStatus }

class RegisterAccountQuery extends BaseQuery {
  final RegisterAccountQueryEnum _enum;

  RegisterAccountQuery(this._enum);

  @override
  Map<String, String> get toQuery => {
    'groupType': param
  };

  String get param {
    switch (_enum) {
      case RegisterAccountQueryEnum.registerAccountType:
        return 'REGISTER_ACCOUNT_TYPE';
      case RegisterAccountQueryEnum.registerAccountStatus:
        return 'REGISTER_ACCOUNT_STATUS';
    }
  }
}