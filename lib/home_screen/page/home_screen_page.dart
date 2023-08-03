import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/widget/device_detector.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: HomeScreenTabletLayout(),
        phone: HomeScreenPhoneLayout()
    );
  }
}

class HomeScreenPhoneLayout extends StatelessWidget {
  const HomeScreenPhoneLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('phone');
  }
}

class HomeScreenTabletLayout extends StatelessWidget {
  const HomeScreenTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('tablet');
  }
}


