import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import '../../../aitriage_core/ui/widget/device_detector.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _Tablet(),
        phone: _Phone());
  }
}

class _Tablet extends StatelessWidget {
  const _Tablet();

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImage.bgSplashScreenTablet, fit: BoxFit.cover,);
  }
}

class _Phone extends StatelessWidget {
  const _Phone();

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImage.bgSplashScreen, fit: BoxFit.cover);
  }
}
