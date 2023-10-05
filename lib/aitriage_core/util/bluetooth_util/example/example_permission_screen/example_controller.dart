import 'package:flutter_aitriage/aitriage_core/util/bluetooth_util/permission_handler/navigate_native_setting.dart';
import 'package:flutter_aitriage/aitriage_core/util/bluetooth_util/repository/bluetooth_repository.dart';
import 'package:get/get.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';


class BluetoothExampleController extends GetxController{
  final isBluetoothOn = true.obs;

  @override
  void onInit() async{
    super.onInit();
    isBluetoothOn.value = await BluetoothRepository().isBluetoothOn();
    BluetoothRepository().streamBluetoothStatus().listen((event) async {
      isBluetoothOn.value = event == BluetoothAdapterState.on;
      if(isBluetoothOn.value){
        await checkPermission();
      }
    });
  }

  @override
  void onReady() async{
    super.onReady();
    if(isBluetoothOn.value){
        await checkPermission();
      }
    }

  Future<bool> checkPermission() async {
    if (!await BluetoothRepository().checkPermissions()) {
      await BluetoothRepository().requestPermission();
    }
    return await BluetoothRepository().checkPermissions();
  }

  void enableBluetooth() async{
    await BluetoothRepository().turnOnBluetooth();
  }
}