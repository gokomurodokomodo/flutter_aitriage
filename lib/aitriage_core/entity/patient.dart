class Patient {
  final String? code;
  final String? fullName;
  final int? nationalityId;
  final int? locationId;
  final int? stateId;
  final int? cityId;
  final int? raceId;
  final String? address;
  final String? gender;
  final String? phoneCode;
  final String? phone;
  final String? email;
  final String? description;
  final dynamic birthday;
  final int? yearOfBirth;

  Patient(
      this.code,
      this.fullName,
      this.nationalityId,
      this.locationId,
      this.stateId,
      this.cityId,
      this.raceId,
      this.address,
      this.gender,
      this.phoneCode,
      this.phone,
      this.email,
      this.description,
      this.birthday,
      this.yearOfBirth);

  Patient.fromJson(dynamic json)
      : code = json?['code'],
        fullName = json?['fullName'],
        nationalityId = json?['nationalityId'],
        locationId = json?['locationId'],
        stateId = json?['stateId'],
        cityId = json?['cityId'],
        raceId = json?['raceId'],
        address = json?['address'],
        gender = json?['gender'],
        phoneCode = json?['phoneCode'],
        phone = json?['phone'],
        email = json?['email'],
        description = json?['description'],
        birthday = json?['birthday'],
        yearOfBirth = json?['yearOfBirth'];
}