import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'example_connect_device_controller.dart';

class ExampleConnectDevicePage extends GetView<ExampleConnectDeviceController> {
  const ExampleConnectDevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Obx(() {
              return Text(controller.spo2.value);
            }),
            Text(controller.sys.value),
            Obx(() {
              return Text(controller.temp.value);
            }),
            Text(controller.hr.value),
            Text(controller.resp.value),
            Text(controller.dia.value),
            Text(controller.cuff.value),
            Text(controller.heartRatePresent.value),
          ],
        )
    );
  }

}