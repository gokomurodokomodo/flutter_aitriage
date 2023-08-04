import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/util/app_event_channel/core/app_event_channel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../aitriage_core/util/app_event_channel/custom_event/finish_init_event.dart';
import '../../../aitriage_core/ui/widget/device_detector.dart';
import 'package:get/get.dart';

import '../../config/main_page_router.dart';

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
        .listen((event) => Get.offNamed(MainPageRoute.gettingStarted));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DeviceDetector(
          tablet: _SplashScreenTablet(),
          phone: _SplashScreenPhone()),
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

class _SplashScreenPhone extends StatelessWidget {
  const _SplashScreenPhone();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(AppImage.bgSplashScreen, fit: BoxFit.cover),
    );
  }
}
