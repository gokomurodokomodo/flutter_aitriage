import 'package:flutter_aitriage/aitriage_core/network/common/base_request.dart';

class VerifyLoginRequest extends BaseRequest {
  final String userName;
  final String password;
  final String verificationCode;

  VerifyLoginRequest({
    required this.userName,
    required this.password,
    required this.verificationCode
  });

  @override
  Map<String, dynamic> toRequest() => {
    'userName': userName,
    'password': password,
    'verificationCode': verificationCode
  };
}