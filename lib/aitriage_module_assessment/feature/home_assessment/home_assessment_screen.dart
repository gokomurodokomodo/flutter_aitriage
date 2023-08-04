import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';

class HomeAssessmentScreen extends StatelessWidget {
  const HomeAssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _HomeAssessmentScreenTablet(),
        phone: _HomeAssessmentScreenPhone()
    );
  }
}

class _HomeAssessmentScreenTablet extends StatelessWidget {
  const _HomeAssessmentScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _HomeAssessmentScreenPhone extends StatelessWidget {
  const _HomeAssessmentScreenPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}


