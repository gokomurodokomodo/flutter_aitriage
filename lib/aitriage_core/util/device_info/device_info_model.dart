class DeviceInfo {
  DeviceInfo({
    this.deviceGuid,
    this.deviceSerial,
    this.deviceType,
    this.deviceName,
    this.deviceOs,
    this.deviceToken,
    this.deviceEndPoint,
    this.appVersion,
    this.sourceType,
    this.versionCode,
    this.appName,
    this.uuid,
    this.deviceOsVersion
  });

  DeviceInfo.fromJson(dynamic json) {
    deviceGuid = json['deviceGuid'];
    deviceSerial = json['deviceSerial'];
    deviceType = json['deviceType'];
    deviceName = json['deviceName'];
    deviceOs = json['deviceOs'];
    deviceToken = json['deviceToken'];
    deviceEndPoint = json['deviceEndPoint'];
    appVersion = json['appVersion'];
    sourceType = json['sourceType'];
  }

  String? deviceGuid;
  String? deviceSerial;
  String? deviceType;
  String? deviceName;
  String? deviceOs;
  String? deviceToken;
  String? deviceEndPoint;
  String? appVersion;
  String? sourceType;
  String? versionCode;
  String? appName;
  String? uuid;
  String? deviceOsVersion;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['deviceGuid'] = deviceGuid;
    map['deviceSerial'] = deviceSerial;
    map['deviceType'] = deviceType;
    map['deviceName'] = deviceName;
    map['deviceOs'] = deviceOs;
    map['deviceToken'] = deviceToken;
    map['deviceEndPoint'] = deviceEndPoint;
    map['appVersion'] = appVersion;
    map['sourceType'] = sourceType;
    return map;
  }

  String toHeaderJson() {
    return '$appName&space;$appVersion&space;$versionCode&space;$deviceType&space;$deviceOs&space;$deviceName&space;$uuid&space;$deviceOsVersion';
  }
}