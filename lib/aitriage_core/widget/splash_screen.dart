import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/util/app_event_channel/core/app_event_channel.dart';
import 'package:flutter_aitriage/aitriage_core/util/svg_detector/svg_detector.dart';
import 'package:flutter_aitriage/aitriage_core/widget/svg_icon_widget.dart';

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
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImage.tabletBackgroundSplashScreen),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgIconWidget(icon: , name: '',),
            ],
          ),
        )
      ),
    );
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
