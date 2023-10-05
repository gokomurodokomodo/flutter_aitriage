import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_aitriage/aitriage_core/ui/dialog/app_dialog.dart';
import 'package:flutter_aitriage/aitriage_core/util/bluetooth_util/example/example_device_screen/example_device_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ExampleDevicePage extends GetView<ExampleDeviceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
                onTap: () async {
                  await controller.scanDevices();
                  Get.dialog(
                      Obx(() {
                        return controller.devices.value.isEmpty ? const CircularProgressIndicator() :
                         AppDialog(
                           dialogHeight: 1000.h,
                             content: Column(

                            children: [
                              SizedBox(height: 24.h,),
                              const Divider(),
                              SizedBox(height: 24.h,),
                              SizedBox(
                                height: 700.h,
                                child: ListView.builder(
                                  itemCount: controller.devices.value.length,
                                  shrinkWrap: true,
                                  itemBuilder: (_, index) =>
                                      GestureDetector(
                                        onTap: () async {},
                                        child: ListTile(
                                          title: Text(
                                              controller.devices[index].name),
                                          subtitle: Text(
                                              controller.devices[index]
                                                  .macAddress),
                                          trailing: Text(
                                              controller.devices[index].type
                                                  .toString()),
                                        ),
                                      ),
                                ),
                              ),
                              SizedBox(height: 24.h,),
                            ]
                        ), title: 'List Device Scanned');
                      })
                  );
                },
                child: Text('Scan'))
        ],
      ),
    );
  }

}