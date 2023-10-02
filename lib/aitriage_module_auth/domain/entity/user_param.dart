class UserParam {
  int? id;
  int? accountId;
  String? accessToken;
  String? refreshToken;
  String? loginStatus;
  String? avatar;
  String? username;
  String? firstName;
  String? lastName;
  String? fullName;
  String? countryCode;
  String? status;
  String? notifyExpireDate;

  UserParam.fromJson(Map<String, dynamic> json) {
    id = json?['id'];
    accountId = json?['accountId'];
    accessToken = json?['accessToken'];
    refreshToken = json?['refreshToken'];
    loginStatus = json?['loginStatus'];
    avatar = json?['avatar'];
    username = json?['username'];
    firstName = json?['firstName'];
    lastName = json?['lastName'];
    fullName = json?['fullName'];
    countryCode = json?['countryCode'];
    status = json?['status'];
    notifyExpireDate = json?['notifyExpireDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['accountId'] = accountId;
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    data['loginStatus'] = loginStatus;
    data['avatar'] = avatar;
    data['username'] = username;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['fullName'] = fullName;
    data['countryCode'] = countryCode;
    data['status'] = status;
    data['notifyExpireDate'] = notifyExpireDate;
    return data;
  }
}