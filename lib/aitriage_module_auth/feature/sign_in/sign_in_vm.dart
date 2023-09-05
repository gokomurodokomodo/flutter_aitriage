
import 'package:flutter_aitriage/aitriage_core/util/crypto/crypto.dart';
import 'package:flutter_aitriage/aitriage_module_auth/data/api/request/sign_in_request.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/sign_in_uc.dart';

class SignInVM {
  var _username = '';
  var _password = '';

  void updateVM({
    String? username,
    String? password
}){
    _username = username ?? _username;
    _password = password ?? _password;
  }

  String get username => _username;
  String get password => _password;

  Future<SignInRequest> get signInRequest async{
    SignInRequest request = SignInRequest(password: await CryptoUtil.encrypt(_password), username: _username);
    return request;
  }
}