import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/util/app_event_channel/core/app_event_channel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../aitriage_core/util/app_event_channel/custom_event/finish_init_event.dart';
import '../../../aitriage_core/ui/widget/device_detector.dart';
import 'package:get/get.dart';

import '../../config/main_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final appEventChannel = AppEventChannel();
    appEventChannel
        .on<FinishInitEvent>()
        .listen((event) => Get.offNamed(MainRoute.gettingStarted));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DeviceDetector(
          tablet: _Tablet(),
          phone: _Phone()),
    );
  }
}

class _Tablet extends StatelessWidget {
  const _Tablet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImage.bgTabletBackgroundSplashScreen),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImage.icAppLogo, width: 210.w, height: 220.h,),
              Image.asset(AppImage.bgTextAitriage, height: 64.h,),
            ],
          ),
        )
      ),
    );
  }
}

class _Phone extends StatelessWidget {
  const _Phone();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(AppImage.bgSplashScreen, fit: BoxFit.cover),
    );
  }
}
