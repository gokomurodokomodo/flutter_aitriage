class UserInfo {
  final int? id;
  final String? userName;
  final String? password;
  final String? type;
  final String? status;
  // "activationCode": null,
  // "affiliationCode": null,
  // "affiliationUrl": null,
  // "firstName": "Tran",
  // "lastName": "Hue",
  // "fullName": "Tran Hue",
  // "displayName": "Tran Hue",
  // "avatar": null,
  // "birthday": null,
  // "yearOfBirth": null,
  // "nationalityCode": null,
  // "nationality": null,
  // "phone": "12345",
  // "phoneVerified": false,
  // "email": "huetransky@gmail.com",
  // "emailVerified": true,
  // "countryId": 240,
  // "countryCode": "+84",
  // "countryName": "Vietnam",
  // "stateId": null,
  // "cityId": null,
  // "cityName": null,
  // "districtId": null,
  // "districtName": null,
  // "address": null,
  // "rememberToken": null,
  // "email2FaEnabled": false,
  // "sms2FaEnabled": false,
  // "app2FaEnabled": false,
  // "app2FaSecret": null,
  // "userGroupId": null,
  // "numOfWrongLogin": 0,
  // "numOfWrongCode": 0,
  // "numOfWrongPin": 0,
  // "pin": null,
  // "pinEnabled": 0,
  // "login2FaEnabled": 0,
  // "transaction2FaEnabled": 1,
  // "numOfLogin": 90,
  // "lastTimeLogin": "2023-09-06T07:22:34.000+00:00",
  // "createdAt": null,
  // "updatedAt": "2023-09-05T10:36:34.000+00:00",
  // "accessToken": null,
  // "accountId": 2,
  // "roles": []

  UserInfo.fromJson(dynamic json)
      : id = json?['id'],
        userName = json?['username'],
        type = json?['type'],
        password = json?['password'],
        status = json?['status'];
}