import 'dart:convert';

class DeviceModel {
  String name;
  String macAddress;
  String type;

  DeviceModel(this.name, this.macAddress, this.type);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'macAddress': macAddress,
      'type': type,
    };
  }

  void fromJson(Map<String, dynamic> json) {
    name = json['name'];
    macAddress = json['macAddress'];
    type = json['type'];
  }

  String toString() {
    return jsonEncode(toJson());
  }
}