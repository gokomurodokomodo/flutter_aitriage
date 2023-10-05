import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_aitriage/aitriage_core/util/bluetooth_util/permission_handler/navigate_native_setting.dart';
import 'package:flutter_aitriage/aitriage_core/util/bluetooth_util/permission_handler/permission_check.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:plugin_bluetooth_android/plugin_bluetooth.dart';


class BluetoothRepository{
  BluetoothRepository._();

  factory BluetoothRepository(){
    return BluetoothRepository._();
  }

  final bluetoothPlugin = PluginBluetooth();

  /*PERMISSION CHECK, BLUETOOTH CHECK AND PERMISSION REQUEST*/
  ///Current status of bluetooth
  Future<bool> isBluetoothOn() async{
    return PermissionCheck().isBluetoothOn();
  }


  ///Stream of bluetooth status
  Stream<BluetoothAdapterState> streamBluetoothStatus(){
    return PermissionCheck().streamBluetoothStatus();
  }

  ///check if permission is granted
  Future<bool> checkPermissions() async{
    return await PermissionCheck().checkPermissions();
  }

  ///request for necessary permission
  Future<Map<Permission, PermissionStatus>?> requestPermission() async{
    return await PermissionCheck().requestPermission();
  }

  ///turn bluetooth on(ONLY FOR ANDROID !!!!!!!)
  ///if timeout on android will navigate to bluetooth setting screen.
  ///if iOS will navigate to bluetooth setting screen instead.
  Future<void> turnOnBluetooth() async{
    if(Platform.isAndroid){
      await FlutterBluePlus.turnOn().timeout(const Duration(seconds: 10),
          onTimeout: () {
        NavigateNativeSetting().goToBluetoothSetting();
      });
    } else {
      NavigateNativeSetting().goToBluetoothSetting();
    }
  }

  /*DATA PARSER AND TRANSFER*/
  ///*For data core please use enum [AppEventChannel] in core/plugin_bluetooth_event_channel.dart,
  ///this will provide all the stream of data you'll need.
  ///this section provide function to scan, connect, disconnect

  ///function to scan device.
  Future<void> scanDevices() async{
    await bluetoothPlugin.scanDevices();
  }

  ///function to stop scan.
  Future<void> stopScanDevices() async{
    await bluetoothPlugin.stopScanDevices();
  }

  ///function to connect to device.
  Future<bool> connectDevice(String device) async{
    bool connected = await bluetoothPlugin.connectDevice(device);
    return connected;
  }

  ///function to disconnect device.
  Future<void> disconnectDevice() async {
    await bluetoothPlugin.disconnectDevice();
  }
}