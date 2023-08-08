import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/slider_button.dart';
import 'package:flutter_aitriage/aitriage_module_setting/config/setting_route.dart';
import 'package:get/get.dart';

class HomeSettingScreen extends StatelessWidget {
  const HomeSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _Tablet(),
        phone: _Phone()
    );
  }
}

class _Tablet extends StatelessWidget {
  const _Tablet();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _Phone extends StatelessWidget {
  const _Phone();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
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
              const Row(
                children: [
                  Icon(Icons.notifications_none_sharp),
                  Text('Notification'),
                  Spacer(),
                  SliderButton(height: 24, width: 40)
                ],
              ),
              GestureDetector(
                onTap: () => Get.toNamed(SettingRoute.supportCenter, id: SettingRoute.nestedId),
                child: const Row(
                  children: [
                    Icon(Icons.help_center_outlined),
                    Text('Support Center'),
                    Spacer(),
                    Icon(Icons.chevron_right)
                  ],
                ),
              ),
              const Row(
                children: [
                  Icon(Icons.phone),
                  Text('Contact'),
                  Spacer(),
                  Icon(Icons.chevron_right)
                ],
              ),
              GestureDetector(
                onTap: () => Get.toNamed(SettingRoute.aboutUs, id: SettingRoute.nestedId),
                child: const Row(
                  children: [
                    Icon(Icons.info),
                    Text('About Us'),
                    Spacer(),
                    Icon(Icons.chevron_right)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


