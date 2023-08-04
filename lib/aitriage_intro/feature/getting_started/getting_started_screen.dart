import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';

class GettingStartedScreen extends StatelessWidget {
  const GettingStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _GettingStartedScreenTablet(),
        phone: _GettingStartedScreenPhone()
    );
  }
}

class _GettingStartedScreenTablet extends StatelessWidget {
  const _GettingStartedScreenTablet();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _GettingStartedScreenPhone extends StatelessWidget {
  const _GettingStartedScreenPhone();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImage.bgNonIconSplashScreen),

        ],
      ),
    );
  }
}


