import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

///ios sẽ check quyền bluetooth mỗi khi sử dụng bluetooth nên không cần request quyền.
///Với android cần request quyền.
class PermissionCheck{

  PermissionCheck._();

  /// các quyền cần request trong android.
  final androidPermission =[
    Permission.bluetoothConnect,
    Permission.bluetooth,
    Permission.bluetoothScan,
    Permission.bluetoothAdvertise,
    Permission.locationWhenInUse,
  ];

  factory PermissionCheck(){
    return PermissionCheck._();
  }

  Stream<BluetoothAdapterState> streamBluetoothStatus(){
    return FlutterBluePlus.adapterState;
  }

  Future<bool> isBluetoothOn() async{
    final firstState = await FlutterBluePlus.adapterState.first;
    return BluetoothAdapterState.on == firstState;
  }

  Future<Map<Permission, PermissionStatus>?> requestPermission() async{
    if(Platform.isAndroid){
      final result = await androidPermission.request();
      return result;
    } else {
      return null;
    }
  }

  Future<bool> checkPermissions() async {
    if(Platform.isAndroid){
      var bluetoothConnectStatus = await Permission.bluetoothConnect.status;
      var bluetoothStatus = await Permission.bluetooth.status;
      var bluetoothScanStatus = await Permission.bluetoothScan.status;
      var bluetoothAdvertiseStatus = await Permission.bluetoothAdvertise.status;
      var locationWhenInUseStatus = await Permission.locationWhenInUse.status;

      if (bluetoothConnectStatus.isGranted &&
          bluetoothStatus.isGranted &&
          bluetoothScanStatus.isGranted &&
          bluetoothAdvertiseStatus.isGranted &&
          locationWhenInUseStatus.isGranted) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }
}