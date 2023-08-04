import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/color_button.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../aitriage_core/common/app_color.dart';

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
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImage.icAppLogo, width: 128, height: 137),
                Image.asset(AppImage.bgTextAitriage, width: 145, height: 64,),
                ColorButton(
                  title: 'Get started',
                  shouldEnable: true,
                  width: 140.w,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColor.colorBorderDisable,
                          width: 1.w,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(
                          Radius.circular(8.w)),
                      gradient: AppColor.gradientGettingStartedButton))
              ],
            ),
          ),

        ],
      ),
    );
  }
}


