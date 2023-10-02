import '../../../../aitriage_core/network/common/base_request.dart';

class SignInRequest extends BaseRequest{
  final String username;
  final String password;

  SignInRequest({required this.password, required this.username});

  @override
  Map<String, dynamic> toRequest() => {
    'userName': username,
    'password':password
  };
}