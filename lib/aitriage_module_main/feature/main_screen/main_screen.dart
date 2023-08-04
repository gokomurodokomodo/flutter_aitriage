import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: MainScreenTablet(),
        phone: MainScreenPhone()
    );
  }
}

class MainScreenTablet extends StatelessWidget {
  const MainScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MainScreenPhone extends StatelessWidget {
  const MainScreenPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(),
    );
  }
}


