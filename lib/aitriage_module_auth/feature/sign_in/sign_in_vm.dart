import 'package:flutter_aitriage/aitriage_core/util/crypto/crypto.dart';
import 'package:flutter_aitriage/aitriage_module_auth/data/api/request/sign_in_request.dart';
import '../../../aitriage_core/entity/country.dart';

class SignInVM {
  var _username = '';
  var _password = '';
  final _countryList = <Country>[];

  void updateVM({
    String? username,
    String? password,
    List<Country>? countryList
}){
    _username = username ?? _username;
    _password = password ?? _password;

    if (countryList != null) {
      _countryList.clear();
      _countryList.addAll(countryList);
    }
  }

  String get username => _username;
  String get password => _password;

  Future<SignInRequest> get signInRequest async{
    SignInRequest request = SignInRequest(password: await CryptoUtil.encrypt(_password), username: _username);
    return request;
  }

  List<Country> get countryList => _countryList.toList();
}