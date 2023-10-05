import 'package:flutter/services.dart';
import 'package:plugin_bluetooth_android/plugin_bluetooth.dart';

enum BluetoothDeviceType {
  unknown,
  classic,
  lowEnergy,
  dual,
}

extension BluetoothDeviceTypeExtension on BluetoothDeviceType {
  String get name {
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
}

class BluetoothProvider{
  BluetoothProvider._();

  factory BluetoothProvider(){
    return BluetoothProvider._();
  }

  final _pluginBluetoothAndroidPlugin = PluginBluetooth();

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion =
          await _pluginBluetoothAndroidPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
  }
}