class UserParam{
  int? id;
  int? accountId;
  String? accessToken;
  String? refreshToken;
  String? avatar;
  String? username;
  String? firstName;
  String? lastName;
  String? fullName;
  String? countryCode;
  String? status;

  UserParam.fromJson(dynamic json)
    : 
    id = json?["id"],
    accountId = json?["accountId"],
    accessToken = json?["accessToken"],
    refreshToken = json?["refreshToken"],
    avatar = json?["avatar"],
    username = json?["username"],
    firstName = json?["firstName"],
    lastName = json?["lastName"],
    fullName = json?["fullName"],
    countryCode = json?["countryCode"],
    status = json?["status"];

  Map<String, dynamic> toJson() => {
    "id": id,
    "accountId": accountId,
    "accessToken": accessToken,
    "refreshToken": refreshToken,
    "avatar": avatar,
    "username": username,
    "firstName": firstName,
    "lastName": lastName,
    "fullName": fullName,
    "countryCode": countryCode,
    "status": status,
  };
}