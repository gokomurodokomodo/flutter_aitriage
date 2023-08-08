import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/slider_button.dart';
import 'package:get/get.dart';

class HomeSettingScreen extends StatelessWidget {
  const HomeSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _HomeSettingScreenTablet(),
        phone: _HomeSettingScreenPhone()
    );
  }
}

class _HomeSettingScreenTablet extends StatelessWidget {
  const _HomeSettingScreenTablet();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _HomeSettingScreenPhone extends StatelessWidget {
  const _HomeSettingScreenPhone();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text('Setting'),
            Spacer(),
            Icon(Icons.notification_important)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SliderButton(height: 50, width: 200).marginSymmetric(horizontal: 20)
            ],
          ),
        ),
      ),
    );
  }
}


