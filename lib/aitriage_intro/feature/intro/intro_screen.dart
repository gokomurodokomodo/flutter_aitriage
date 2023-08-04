import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _IntroScreenTable(),
        phone: _IntroScreenPhone()
    );
  }
}

class _IntroScreenTable extends StatelessWidget {
  const _IntroScreenTable({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _IntroScreenPhone extends StatelessWidget {
  const _IntroScreenPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


