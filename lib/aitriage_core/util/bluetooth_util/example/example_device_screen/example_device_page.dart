import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_aitriage/aitriage_core/ui/dialog/app_dialog.dart';
import 'package:flutter_aitriage/aitriage_core/util/bluetooth_util/bluetooth_widget/bluetooth_device_scan.dart';
import 'package:flutter_aitriage/aitriage_core/util/bluetooth_util/example/example_connect_device_screen/example_connect_device_controller.dart';
import 'package:flutter_aitriage/aitriage_core/util/bluetooth_util/example/example_device_screen/example_device_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../example_connect_device_screen/example_device_page.dart';

class ExampleDevicePage extends GetView<ExampleDeviceController> {
  const ExampleDevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
                onTap: () async {
                  await controller.scanDevices();
                  Get.dialog(
                      Obx(() {
                        return BluetoothDeviceScanDialog(
                            listDevices: controller.devices.value,
                            emptyListViewPlaceholder: const CircularProgressIndicator(),
                            title: 'List Scan Devices',
                            primaryButtonTitle: 'Connect',
                            secondaryButtonTitle: 'Cancel',
                            primaryAction:(deviceMACAddress) {
                              controller.connectDevice(deviceMACAddress).then((result) {
                                if(result == false){
                                  Get.snackbar('Error', 'Cannot connect to device');
                                } else {
                                  Get.to(
                                          () => ExampleConnectDevicePage(),
                                      binding: BindingsBuilder(() {
                                        Get.put(ExampleConnectDeviceController());
                                      })
                                  );
                                }
                              });

                            },
                        );
                      })
                  );
                },
                child: Center(child: Text('Scan')))
        ],
      ),
    );
  }

}