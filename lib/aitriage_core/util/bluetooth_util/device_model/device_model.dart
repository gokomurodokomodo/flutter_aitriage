import 'dart:convert';
enum BluetoothDeviceType {
  unknown,
  classic,
  lowEnergy,
  dual,
}

extension BluetoothDeviceTypeExtension on BluetoothDeviceType {
  String get nameTag {
    switch (this) {
      case BluetoothDeviceType.unknown:
        return 'DEVICE_TYPE_UNKNOWN';
      case BluetoothDeviceType.classic:
        return 'DEVICE_TYPE_CLASSIC';
      case BluetoothDeviceType.lowEnergy:
        return 'DEVICE_TYPE_LE';
      case BluetoothDeviceType.dual:
        return 'DEVICE_TYPE_DUAL';
    }
  }

  String get name{
    switch (this) {
      case BluetoothDeviceType.unknown:
        return 'Unknown';
      case BluetoothDeviceType.classic:
        return 'Classic';
      case BluetoothDeviceType.lowEnergy:
        return 'BLE';
      case BluetoothDeviceType.dual:
        return 'Dual';
    }
  }

  int get index{
    switch (this) {
      case BluetoothDeviceType.unknown:
        return 0;
      case BluetoothDeviceType.classic:
        return 1;
      case BluetoothDeviceType.lowEnergy:
        return 2;
      case BluetoothDeviceType.dual:
        return 3;
    }
  }
}

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
    type = (BluetoothDeviceType.values.firstWhere((element) => element.index == int.parse(json['type']))).name;
  }

  String toString() {
    return jsonEncode(toJson());
  }
}