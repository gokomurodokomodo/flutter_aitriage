class UserInfo {
  int? id;
  String? username;
  String? password;
  String? type;
  String? status;
  String? activationCode;
  String? affiliationCode;
  String? affiliationUrl;
  String? firstName;
  String? lastName;
  String? fullName;
  String? displayName;
  String? avatar;
  String? gender;
  String? birthday;
  int? yearOfBirth;
  String? nationalityCode;
  String? nationality;
  String? phone;
  bool? phoneVerified;
  String? email;
  bool? emailVerified;
  int? countryId;
  String? countryCode;
  String? countryName;
  num? stateId;
  num? cityId;
  String? cityName;
  num? districtId;
  String? districtName;
  String? address;
  String? rememberToken;
  bool? email2FaEnabled;
  bool? sms2FaEnabled;
  bool? app2FaEnabled;
  String? app2FaSecret;
  num? userGroupId;
  int? numOfWrongLogin;
  int? numOfWrongCode;
  int? numOfWrongPin;
  String? pin;
  int? pinEnabled;
  int? login2FaEnabled;
  int? transaction2FaEnabled;
  int? numOfLogin;
  String? lastTimeLogin;
  num? createdBy;
  String? createdAt;
  num? updatedBy;
  String? updatedAt;
  String? accessToken;
  int? accountId;
  List<Roles>? roles;
  List<Locations>? locations;

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    type = json['type'];
    status = json['status'];
    activationCode = json['activationCode'];
    affiliationCode = json['affiliationCode'];
    affiliationUrl = json['affiliationUrl'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    displayName = json['displayName'];
    avatar = json['avatar'];
    gender = json['gender'];
    birthday = json['birthday'];
    yearOfBirth = json['yearOfBirth'];
    nationalityCode = json['nationalityCode'];
    nationality = json['nationality'];
    phone = json['phone'];
    phoneVerified = json['phoneVerified'];
    email = json['email'];
    emailVerified = json['emailVerified'];
    countryId = json['countryId'];
    countryCode = json['countryCode'];
    countryName = json['countryName'];
    stateId = json['stateId'];
    cityId = json['cityId'];
    cityName = json['cityName'];
    districtId = json['districtId'];
    districtName = json['districtName'];
    address = json['address'];
    rememberToken = json['rememberToken'];
    email2FaEnabled = json['email2FaEnabled'];
    sms2FaEnabled = json['sms2FaEnabled'];
    app2FaEnabled = json['app2FaEnabled'];
    app2FaSecret = json['app2FaSecret'];
    userGroupId = json['userGroupId'];
    numOfWrongLogin = json['numOfWrongLogin'];
    numOfWrongCode = json['numOfWrongCode'];
    numOfWrongPin = json['numOfWrongPin'];
    pin = json['pin'];
    pinEnabled = json['pinEnabled'];
    login2FaEnabled = json['login2FaEnabled'];
    transaction2FaEnabled = json['transaction2FaEnabled'];
    numOfLogin = json['numOfLogin'];
    lastTimeLogin = json['lastTimeLogin'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedBy = json['updatedBy'];
    updatedAt = json['updatedAt'];
    accessToken = json['accessToken'];
    accountId = json['accountId'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
    if (json['locations'] != null) {
      locations = <Locations>[];
      json['locations'].forEach((v) {
        locations!.add(Locations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['username'] = username;
    data['password'] = password;
    data['type'] = type;
    data['status'] = status;
    data['activationCode'] = activationCode;
    data['affiliationCode'] = affiliationCode;
    data['affiliationUrl'] = affiliationUrl;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['fullName'] = fullName;
    data['displayName'] = displayName;
    data['avatar'] = avatar;
    data['gender'] = gender;
    data['birthday'] = birthday;
    data['yearOfBirth'] = yearOfBirth;
    data['nationalityCode'] = nationalityCode;
    data['nationality'] = nationality;
    data['phone'] = phone;
    data['phoneVerified'] = phoneVerified;
    data['email'] = email;
    data['emailVerified'] = emailVerified;
    data['countryId'] = countryId;
    data['countryCode'] = countryCode;
    data['countryName'] = countryName;
    data['stateId'] = stateId;
    data['cityId'] = cityId;
    data['cityName'] = cityName;
    data['districtId'] = districtId;
    data['districtName'] = districtName;
    data['address'] = address;
    data['rememberToken'] = rememberToken;
    data['email2FaEnabled'] = email2FaEnabled;
    data['sms2FaEnabled'] = sms2FaEnabled;
    data['app2FaEnabled'] = app2FaEnabled;
    data['app2FaSecret'] = app2FaSecret;
    data['userGroupId'] = userGroupId;
    data['numOfWrongLogin'] = numOfWrongLogin;
    data['numOfWrongCode'] = numOfWrongCode;
    data['numOfWrongPin'] = numOfWrongPin;
    data['pin'] = pin;
    data['pinEnabled'] = pinEnabled;
    data['login2FaEnabled'] = login2FaEnabled;
    data['transaction2FaEnabled'] = transaction2FaEnabled;
    data['numOfLogin'] = numOfLogin;
    data['lastTimeLogin'] = lastTimeLogin;
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['updatedBy'] = updatedBy;
    data['updatedAt'] = updatedAt;
    data['accessToken'] = accessToken;
    data['accountId'] = accountId;
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    if (locations != null) {
      data['locations'] = locations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Roles {
  int? id;
  int? userId;
  String? objectType;
  int? roleId;
  String? roleCode;
  String? status;
  int? locationId;
  int? accountId;
  String? accountNo;

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    objectType = json['objectType'];
    roleId = json['roleId'];
    roleCode = json['roleCode'];
    status = json['status'];
    locationId = json['locationId'];
    accountId = json['accountId'];
    accountNo = json['accountNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['objectType'] = objectType;
    data['roleId'] = roleId;
    data['roleCode'] = roleCode;
    data['status'] = status;
    data['locationId'] = locationId;
    data['accountId'] = accountId;
    data['accountNo'] = accountNo;
    return data;
  }
}

class Locations {
  int? id;
  String? name;
  int? parentId;
  int? levelDepth;
  String? treePath;
  num? position;
  String? avatar;
  String? description;
  String? email;
  String? phone;
  String? phoneExt1;
  String? phoneExt2;
  int? countryId;
  String? countryCode;
  String? countryName;
  int? stateId;
  int? cityId;
  String? cityName;
  int? districtId;
  String? districtName;
  String? address;
  int? numOfUser;
  int? numOfDevice;
  String? notifyExpireDate;
  String? expireDate;
  String? lockDate;
  String? status;
  String? payingStatus;
  String? lastLoginAt;
  String? numOfLogin;
  int? accountId;
  String? accountNo;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;

  Locations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parentId = json['parentId'];
    levelDepth = json['levelDepth'];
    treePath = json['treePath'];
    position = json['position'];
    avatar = json['avatar'];
    description = json['description'];
    email = json['email'];
    phone = json['phone'];
    phoneExt1 = json['phoneExt1'];
    phoneExt2 = json['phoneExt2'];
    countryId = json['countryId'];
    countryCode = json['countryCode'];
    countryName = json['countryName'];
    stateId = json['stateId'];
    cityId = json['cityId'];
    cityName = json['cityName'];
    districtId = json['districtId'];
    districtName = json['districtName'];
    address = json['address'];
    numOfUser = json['numOfUser'];
    numOfDevice = json['numOfDevice'];
    notifyExpireDate = json['notifyExpireDate'];
    expireDate = json['expireDate'];
    lockDate = json['lockDate'];
    status = json['status'];
    payingStatus = json['payingStatus'];
    lastLoginAt = json['lastLoginAt'];
    numOfLogin = json['numOfLogin'];
    accountId = json['accountId'];
    accountNo = json['accountNo'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['parentId'] = parentId;
    data['levelDepth'] = levelDepth;
    data['treePath'] = treePath;
    data['position'] = position;
    data['avatar'] = avatar;
    data['description'] = description;
    data['email'] = email;
    data['phone'] = phone;
    data['phoneExt1'] = phoneExt1;
    data['phoneExt2'] = phoneExt2;
    data['countryId'] = countryId;
    data['countryCode'] = countryCode;
    data['countryName'] = countryName;
    data['stateId'] = stateId;
    data['cityId'] = cityId;
    data['cityName'] = cityName;
    data['districtId'] = districtId;
    data['districtName'] = districtName;
    data['address'] = address;
    data['numOfUser'] = numOfUser;
    data['numOfDevice'] = numOfDevice;
    data['notifyExpireDate'] = notifyExpireDate;
    data['expireDate'] = expireDate;
    data['lockDate'] = lockDate;
    data['status'] = status;
    data['payingStatus'] = payingStatus;
    data['lastLoginAt'] = lastLoginAt;
    data['numOfLogin'] = numOfLogin;
    data['accountId'] = accountId;
    data['accountNo'] = accountNo;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}