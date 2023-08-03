import 'package:flutter/material.dart';
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
        child: ColorButton(title: 'Confirm').paddingSymmetric(horizontal: 20.w),
      ),
    );
  }
}


