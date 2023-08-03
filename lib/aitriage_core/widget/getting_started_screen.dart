import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/widget/app_dialog.dart';
import 'package:flutter_aitriage/aitriage_core/widget/color_button.dart';
import 'package:flutter_aitriage/aitriage_core/widget/device_detector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GettingStartedScreen extends StatelessWidget {
  const GettingStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _GettingStartedScreenTablet(),
        phone: _GettingStartedScreenPhone()
    );
  }
}

class _GettingStartedScreenTablet extends StatelessWidget {
  const _GettingStartedScreenTablet();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _GettingStartedScreenPhone extends StatelessWidget {
  const _GettingStartedScreenPhone();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ColorButton(
            title: 'Confirm',
            onTap: () => Get.dialog(AppDialog(
              primaryButtonTitle: 'Procceed',
              secondaryButtonTitle: 'End Assessment',
              title: 'Connecting Device',
              content: Container(
                height: 400,
                child: ListView(
                  children: [
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                  ],
                ),
              ),
            )),
        ).paddingSymmetric(horizontal: 20.w),
      ),
    );
  }
}


