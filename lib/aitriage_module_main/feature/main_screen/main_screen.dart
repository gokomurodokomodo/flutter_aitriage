import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_module_main/feature/main_screen/main_controller.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _MainScreenTablet(),
        phone: _MainScreenPhone()
    );
  }
}

class _MainScreenTablet extends GetView<MainController> {
  const _MainScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _MainScreenPhone extends GetView<MainController> {
  const _MainScreenPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.red),
    );
  }
}


