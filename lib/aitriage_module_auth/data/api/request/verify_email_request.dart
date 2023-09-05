import 'package:flutter_aitriage/aitriage_core/network/common/base_request.dart';

class VerifyEmailRequest extends BaseRequest {
  final String email;
  final String verificationCode;

  VerifyEmailRequest({
    required this.email,
    required this.verificationCode
  });

  @override
  Map<String, dynamic> toRequest() => {
    'email': email,
    'verificationCode': verificationCode
  };
}