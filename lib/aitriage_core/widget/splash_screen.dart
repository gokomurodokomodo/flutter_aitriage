import 'package:flutter/material.dart';

import 'device_detector.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _SplashScreenTablet(),
        phone: _SplashScreenPhone()
    );
  }
}

class _SplashScreenTablet extends StatelessWidget {
  const _SplashScreenTablet();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _SplashScreenPhone extends StatelessWidget {
  const _SplashScreenPhone();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
