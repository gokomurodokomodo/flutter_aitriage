class Location {
  final int? id;
  final String? name;
  final String? avatar;
  final String? email;
  final String? countryCode;
  final String? countryName;
  final String? address;
  final int? numOfUser;
  final int? numOfDevice;
  final String? status;
  final int? accountId;
  final String? accountNo;
  final int? countryId;

  Location.fromJson(dynamic json)
      : id = json?['id'],
        name = json?['name'],
        avatar = json?['avatar'],
        email = json?['email'],
        countryCode = json?['countryCode'],
        countryName = json?['countryName'],
        address = json?['address'],
        numOfUser = json?['numOfUser'],
        numOfDevice = json?['numOfDevice'],
        status = json?['status'],
        accountId = json?['accountId'],
        accountNo = json?['accountNo'],
        countryId = json?['countryId'];
}