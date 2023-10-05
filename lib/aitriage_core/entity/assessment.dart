import 'dart:ffi';

class Assessment {
  final int? id;
  final int? customerId;
  final String? customerCode;
  final String? fullName;
  dynamic firstName;
  dynamic lastName;
  dynamic idNumber;
  final String? phone;
  final String? email;
  final int? yearOld;
  dynamic avatar;
  final String? gender;
  final int? raceId;
  final int? cityId;
  final String? cityName;
  final int? doctorId;
  final String? doctorName;
  final String? assessmentDate;
  final int? assessmentDuration;
  final int? vitalMeanHr;
  final int? vitalMaxHr;
  final int? vitalMinHr;
  final int? vitalRespRate;
  final int? vitalSpo2;
  final int? vitalNibp;
  final int? vitalFio2;
  final int? vitalTemp;
  final String? hearScoreHistory;
  final String? hearScoreEcg;
  final String? hearScoreRiskFactor;
  final String? hearScoreAge;
  final double? hrvTimeMean;
  final double? hrvTimeMedian;
  final double? hrvTimeSdnn;
  final double? hrvTimeNn50;
  final double? hrvTimePnn50;
  final double? hrvTimeNnx;
  final double? hrvTimePnnx;
  final double? hrvTimeRmssd;
  final double? hrvTimeNnskew;
  final double? hrvTimeNnkurt;
  final double? hrvTimeMeanhr;
  final double? hrvTimeSdhr;
  final double? hrvTimeHrvti;
  final double? hrvTimeTinn;
  final double? hrvFreqPeakvlf;
  final double? hrvFreqPeaklf;
  final double? hrvFreqPeakhf;
  final double? hrvFreqPvlf;
  final double? hrvFreqPlf;
  final double? hrvFreqPhf;
  final double? hrvFreqPtotal;
  final double? hrvFreqNlf;
  final double? hrvFreqNhf;
  final double? hrvFreqLfhf;
  final double? hrvFreqVlfper;
  final double? hrvFreqLfper;
  final double? hrvFreqHfper;
  final double? hrvNlSd1;
  final double? hrvNlSd2;
  final double? hrvNlSd12Ratio;
  final double? hrvNlAentropy;
  final double? hrvNlSentropy;
  final double? hrvNlAlpha1;
  final double? hrvNlAlpha2;
  final double? hrnvMad;
  final double? hrnvKfd;
  final double? hrnvZug;
  final double? hrnvHuey;
  final double? hrnvHann;
  final double? hrnvHfd5;
  final double? hrnvHfd10;
  final double? hrnvHfd20;
  final double? hrnvHfd30;
  final double? hrnvHfd40;
  final List<int>? hrnvIbi;
  final List<int>? hrnvHistIbiValue;
  final List<int>? hrnvHistIbiNum;
  final List<int>? hrnvPsd;
  final List<int>? hrnvF;
  final String? ecgDataUrl;
  final double? riskScore;
  final String? riskScoreCategory;
  final String? riskScoreStatus;
  final String? dispStatus;
  final int? deviceId;
  final String? deviceType;
  final String? deviceOs;
  final String? deviceName;
  final String? appVersion;
  final int? locationId;
  final int? accountId;
  final String? accountNo;
  final int? createdBy;
  dynamic updatedBy;
  dynamic deletedBy;
  final String? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  final List<double>? hrnvIbiDouble;
  final List<double>? hrnvHistIbiValueDouble;
  final List<double>? hrnvHistIbiNumDouble;
  final List<double>? hrnvPsdDouble;
  final List<double>? hrnvFDouble;

  Assessment.fromJson(dynamic json)
      : id = json?['id'],
        customerId = json?['customerId'],
        customerCode = json?['customerCode'],
        fullName = json?['fullName'],
        firstName = json?['firstName'],
        lastName = json?['lastName'],
        idNumber = json?['idNumber'],
        phone = json?['phone'],
        email = json?['email'],
        yearOld = json?['yearOld'],
        avatar = json?['avatar'],
        gender = json?['gender'],
        raceId = json?['raceId'],
        cityId = json?['cityId'],
        cityName = json?['cityName'],
        doctorId = json?['doctorId'],
        doctorName = json?['doctorName'],
        assessmentDate = json?['assessmentDate'],
        assessmentDuration = json?['assessmentDuration'],
        vitalMeanHr = json?['vitalMeanHr'],
        vitalMaxHr = json?['vitalMaxHr'],
        vitalMinHr = json?['vitalMinHr'],
        vitalRespRate = json?['vitalRespRate'],
        vitalSpo2 = json?['vitalSpo2'],
        vitalNibp = json?['vitalNibp'],
        vitalFio2 = json?['vitalFio2'],
        vitalTemp = json?['vitalTemp'],
        hearScoreHistory = json?['hearScoreHistory'],
        hearScoreEcg = json?['hearScoreEcg'],
        hearScoreRiskFactor = json?['hearScoreRiskFactor'],
        hearScoreAge = json?['hearScoreAge'],
        hrvTimeMean = json?['hrvTimeMean'],
        hrvTimeMedian = json?['hrvTimeMedian'],
        hrvTimeSdnn = json?['hrvTimeSdnn'],
        hrvTimeNn50 = json?['hrvTimeNn50'],
        hrvTimePnn50 = json?['hrvTimePnn50'],
        hrvTimeNnx = json?['hrvTimeNnx'],
        hrvTimePnnx = json?['hrvTimePnnx'],
        hrvTimeRmssd = json?['hrvTimeRmssd'],
        hrvTimeNnskew = json?['hrvTimeNnskew'],
        hrvTimeNnkurt = json?['hrvTimeNnkurt'],
        hrvTimeMeanhr = json?['hrvTimeMeanhr'],
        hrvTimeSdhr = json?['hrvTimeSdhr'],
        hrvTimeHrvti = json?['hrvTimeHrvti'],
        hrvTimeTinn = json?['hrvTimeTinn'],
        hrvFreqPeakvlf = json?['hrvFreqPeakvlf'],
        hrvFreqPeaklf = json?['hrvFreqPeaklf'],
        hrvFreqPeakhf = json?['hrvFreqPeakhf'],
        hrvFreqPvlf = json?['hrvFreqPvlf'],
        hrvFreqPlf = json?['hrvFreqPlf'],
        hrvFreqPhf = json?['hrvFreqPhf'],
        hrvFreqPtotal = json?['hrvFreqPtotal'],
        hrvFreqNlf = json?['hrvFreqNlf'],
        hrvFreqNhf = json?['hrvFreqNhf'],
        hrvFreqLfhf = json?['hrvFreqLfhf'],
        hrvFreqVlfper = json?['hrvFreqVlfper'],
        hrvFreqLfper = json?['hrvFreqLfper'],
        hrvFreqHfper = json?['hrvFreqHfper'],
        hrvNlSd1 = json?['hrvNlSd1'],
        hrvNlSd2 = json?['hrvNlSd2'],
        hrvNlSd12Ratio = json?['hrvNlSd12Ratio'],
        hrvNlAentropy = json?['hrvNlAentropy'],
        hrvNlSentropy = json?['hrvNlSentropy'],
        hrvNlAlpha1 = json?['hrvNlAlpha1'],
        hrvNlAlpha2 = json?['hrvNlAlpha2'],
        hrnvMad = json?['hrnvMad'],
        hrnvKfd = json?['hrnvKfd'],
        hrnvZug = json?['hrnvZug'],
        hrnvHuey = json?['hrnvHuey'],
        hrnvHann = json?['hrnvHann'],
        hrnvHfd5 = json?['hrnvHfd5'],
        hrnvHfd10 = json?['hrnvHfd10'],
        hrnvHfd20 = json?['hrnvHfd20'],
        hrnvHfd30 = json?['hrnvHfd30'],
        hrnvHfd40 = json?['hrnvHfd40'],
        hrnvIbi = convertToListInt(json?['hrnvIbi']),
        hrnvHistIbiValue = convertToListInt(json?['hrnvHistIbiValue']),
        hrnvHistIbiNum = convertToListInt(json?['hrnvHistIbiNum']),
        hrnvPsd = convertToListInt(json?['hrnvPsd']),
        hrnvF = convertToListInt(json?['hrnvF']),
        ecgDataUrl = json?['ecgDataUrl'],
        riskScore = json?['riskScore'],
        riskScoreCategory = json?['riskScoreCategory'],
        riskScoreStatus = json?['riskScoreStatus'],
        dispStatus = json?['dispStatus'],
        deviceId = json?['deviceId'],
        deviceType = json?['deviceType'],
        deviceOs = json?['deviceOs'],
        deviceName = json?['deviceName'],
        appVersion = json?['appVersion'],
        locationId = json?['locationId'],
        accountId = json?['accountId'],
        accountNo = json?['accountNo'],
        createdBy = json?['createdBy'],
        updatedBy = json?['updatedBy'],
        deletedBy = json?['deletedBy'],
        createdAt = json?['createdAt'],
        updatedAt = json?['updatedAt'],
        deletedAt = json?['deletedAt'],
        hrnvIbiDouble = convertToListDouble(json?['hrnvIbiDouble']),
        hrnvHistIbiValueDouble = convertToListDouble(json?['hrnvHistIbiValueDouble']),
        hrnvHistIbiNumDouble = convertToListDouble(json?['hrnvHistIbiNumDouble']),
        hrnvPsdDouble = convertToListDouble(json?['hrnvPsdDouble']),
        hrnvFDouble = convertToListDouble(json?['hrnvFDouble']);
}

List<int> convertToListInt(dynamic json) {
  List<int> listInt = (json as List).map((e) => e as int).toList();
  return listInt;
}

List<double> convertToListDouble(dynamic json) {
  List<double> listInt = (json as List).map((e) => e as double).toList();
  return listInt;
}

