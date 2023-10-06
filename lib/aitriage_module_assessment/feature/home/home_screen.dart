import 'package:flutter/material.dart';
import '../../../aitriage_core/ui/widget/device_detector.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(tablet: _Tablet(), phone: _Phone());
  }
}

class _Tablet extends StatelessWidget {
  const _Tablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _Phone extends StatelessWidget {
  const _Phone({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


