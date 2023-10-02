class UserEmailParam{
  String? email;

  UserEmailParam.fromJson(dynamic json)
    : email = json?['email'];
}