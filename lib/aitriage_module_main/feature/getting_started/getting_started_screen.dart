import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/color_button.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/common/app_color.dart';
import '../../config/main_page_router.dart';

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

void _navigateToIntro(){
  Get.offNamed(MainPageRoute.intro);
}

class _GettingStartedScreenTablet extends StatelessWidget {
  const _GettingStartedScreenTablet();

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
                Image.asset(
                  AppImage.icAppLogo,
                  width: 210.w,
                  height: 220.h,
                ),
                Image.asset(
                  AppImage.bgTextAitriage,
                  height: 64.h,
                ),
                ColorButton(
                    title: 'Get started',
                    onTap: () => _navigateToIntro(),
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
          )),
    );
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
                  onTap: () => _navigateToIntro(),
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


