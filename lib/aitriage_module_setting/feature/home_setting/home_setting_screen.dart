import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';

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
  const _HomeSettingScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _HomeSettingScreenPhone extends StatelessWidget {
  const _HomeSettingScreenPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


