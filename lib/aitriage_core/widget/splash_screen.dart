import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/util/app_event_channel/core/app_event_channel.dart';

import '../util/app_event_channel/custom_event/finish_init_event.dart';
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
    final appEventChannel = AppEventChannel();

    appEventChannel.on<FinishInitEvent>().listen((event) {
      print(event.data);
    });

    return Image.asset(AppImage.bgSplashScreen);
  }
}
