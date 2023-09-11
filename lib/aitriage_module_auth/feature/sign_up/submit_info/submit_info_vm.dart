import '../../../../aitriage_core/service/entity/country.dart';

class SubmitInfoVM {
  var _organizationName = '';
  var _firstName = '';
  var _lastName = '';
  var _phoneNumber = '';
  var _email = '';
  var _password = '';
  var _index = 0;
  final _listCountry = <Country>[];

  void updateVM({
    String? organizationName,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
    String? password,
    int? index,
    List<Country>? listCountry
  }) {
    _organizationName = organizationName ?? _organizationName;
    _firstName = firstName ?? _firstName;
    _lastName = lastName ?? _lastName;
    _phoneNumber = phoneNumber ?? _phoneNumber;
    _email = email ?? _email;
    _password = password ?? _password;
    _index = index ?? _index;

    if (listCountry != null) {
      _listCountry.clear();
      _listCountry.addAll(listCountry);
    }
  }

  String get organizationName => _organizationName;

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get phoneNumber => _phoneNumber;

  String get email => _email;

  String get password => _password;

  int get index => _index;

  List<Country> get listCountry => _listCountry.toList();
}