import 'dart:convert';
import 'package:plugin_bluetooth_android/plugin_bluetooth_event_channel.dart';
import 'package:flutter_aitriage/aitriage_core/util/bluetooth_util/device_model/device_model.dart';
import 'package:flutter_aitriage/aitriage_core/util/bluetooth_util/repository/bluetooth_repository.dart';
import 'package:get/get.dart';

class ExampleDeviceController extends GetxController{
  var devices = <DeviceModel>[].obs;
  var deviceMACAddress = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    EnumAppEventChannel.deviceEvent.getEventStream().listen((event) {
      DeviceModel decodeDevice = DeviceModel("","","");
      decodeDevice.fromJson(jsonDecode(event));
      if(decodeDevice.macAddress != ""){
        if (!deviceMACAddress.value.contains(decodeDevice.macAddress)) {
          devices.value.add(decodeDevice);
          deviceMACAddress.value.add(decodeDevice.macAddress);
        }
      devices.refresh();
    }
    });
  }

  Future<void> scanDevices() async{
    devices.clear();
    deviceMACAddress.clear();
    BluetoothRepository().scanDevices();
  }

  Future<void> stopScanDevice() async{
    BluetoothRepository().stopScanDevices();
  }
}