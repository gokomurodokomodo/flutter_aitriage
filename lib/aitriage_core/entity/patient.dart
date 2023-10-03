class Patient {
  final int? id;
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
  final String? raceName;
  final int? age;
  final String? lastActivityDate;
  final String? avatar;
  final String? cityName;
  final String? nationalityName;
  final String? stateName;
  final int? countryId;

  Patient({
      this.id,
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
      this.yearOfBirth,
      this.avatar,
      this.raceName,
      this.age,
      this.lastActivityDate,
      this.cityName,
      this.nationalityName,
      this.stateName,
      this.countryId
  });

  Patient.fromJson(dynamic json)
      : id = json?['id'],
        code = json?['code'],
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
        yearOfBirth = json?['yearOfBirth'],
        avatar = json?['avatar'],
        raceName = json?['raceName'],
        age = json?['age'],
        lastActivityDate = json?['lastActivityDate'],
        cityName = json?['cityName'],
        nationalityName = json?['nationalityName'],
        stateName = json?['stateName'],
        countryId = json?['countryId'];

  Patient copyWith({
    int? id,
    String? code,
    String? fullName,
    int? nationalityId,
    int? locationId,
    int? stateId,
    int? cityId,
    int? raceId,
    String? address,
    String? gender,
    String? phoneCode,
    String? phone,
    String? email,
    String? description,
    dynamic birthday,
    int? yearOfBirth,
    String? avatar,
    String? raceName,
    int? age,
    String? lastActivityDate,
    String? cityName,
    String? nationalityName,
    String? stateName,
    int? countryId
  }) =>
      Patient(
        id: id ?? this.id,
        code: code ?? this.code,
        fullName: fullName ?? this.fullName,
        nationalityId: nationalityId ?? this.nationalityId,
        locationId: locationId ?? this.locationId,
        stateId: stateId ?? this.stateId,
        cityId: cityId ?? this.cityId,
        raceId: raceId ?? this.raceId,
        address: address ?? this.address,
        gender: gender ?? this.gender,
        phoneCode: phoneCode ?? this.phoneCode,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        description: description ?? this.description,
        birthday: birthday ?? this.birthday,
        yearOfBirth: yearOfBirth ?? this.yearOfBirth,
        avatar: avatar ?? this.avatar,
        raceName: raceName ?? this.raceName,
        age: age ?? this.age,
        lastActivityDate: lastActivityDate ?? this.lastActivityDate,
        cityName: cityName ?? this.cityName,
        nationalityName: nationalityName ?? this.nationalityName,
        stateName: stateName ?? this.stateName,
          countryId: countryId ?? this.countryId);
}

