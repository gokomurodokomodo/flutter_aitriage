import 'package:flutter_aitriage/aitriage_core/network/common/base_request.dart';

class GenerateCodeRequest extends BaseRequest {
  final String email;
  final String reason;

  GenerateCodeRequest({
    required this.email,
    required this.reason
  });

  @override
  Map<String, dynamic> toRequest() => {
    'email': email,
    'reason': reason
  };
}