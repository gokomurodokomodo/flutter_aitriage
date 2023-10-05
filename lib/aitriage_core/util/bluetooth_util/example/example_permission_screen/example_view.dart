import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_aitriage/aitriage_core/util/bluetooth_util/bluetooth_widget/bluetooth_error_dialog.dart';
import 'package:flutter_aitriage/aitriage_core/util/bluetooth_util/example/example_device_screen/example_device_page.dart';
import 'package:flutter_aitriage/aitriage_core/util/bluetooth_util/example/example_permission_screen/example_controller.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

import '../../permission_handler/navigate_native_setting.dart';
import '../example_device_screen/example_device_controller.dart';

class BluetoothExampleView extends GetView<BluetoothExampleController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx((){
          if(controller.isBluetoothOn.value){
            return GestureDetector(
                onTap: () async {
                  final result = await controller.checkPermission();
                  if(result) {
                    Get.to(
                    () => ExampleDevicePage(),
                    binding: BindingsBuilder(() {
                      Get.put(ExampleDeviceController());
                    })
                  );
                  }
                },
                child: Text('Bluetooth is on'));
          } else {
            return BluetoothErrorDialog(
              content: 'You must turn on Bluetooth to use this function',
              title: 'Bluetooth is off',
              primaryTitle: 'Turn on Bluetooth',
              secondaryTitle: 'Back',
              primaryAction: controller.enableBluetooth,
              secondaryAction:() => Get.back(),
            );
          }
        }),
      ),
    );
  }

}