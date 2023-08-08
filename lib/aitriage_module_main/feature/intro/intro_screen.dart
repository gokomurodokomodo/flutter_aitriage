import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/color_button.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_module_main/config/main_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../../aitriage_core/common/app_color.dart';
import 'package:get/get.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _Tablet(),
        phone: _Phone()
    );
  }
}

class _Tablet extends StatefulWidget {
  const _Tablet();

  @override
  State<_Tablet> createState() => _TabletState();
}

class _TabletState extends State<_Tablet> {
  final rawPages = <Widget>[];

  @override
  void initState() {
    super.initState();

    for (int i = 1; i <= 4; i++) {
      rawPages.add(Image.asset('./lib/aitriage_core/asset/image/bg_intro_${i}_tablet.png', fit: BoxFit.fitWidth));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: IntroductionScreen(
              rawPages: rawPages,
              showSkipButton: true,
              showNextButton: false,
              skip: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.w),
                  decoration: BoxDecoration(
                    color: AppColor.colorButtonBackgroundEnable,
                    borderRadius: BorderRadius.all(Radius.circular(25.w)),
                  ),
                  child: const Text("Skip", style: TextStyle(fontWeight: FontWeight.w700, color: AppColor.colorButtonTextEnable))),
              done: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.w),
                  decoration: BoxDecoration(
                    color:  AppColor.colorButtonBackgroundEnable,
                    borderRadius: BorderRadius.all(Radius.circular(25.w)),
                  ),
                  child: const Text("Done", style: TextStyle(fontWeight: FontWeight.w700, color: AppColor.colorButtonTextEnable))),
              onDone: () {
                // On Done button pressed
              },
              onSkip: () {
                // On Skip button pressed
              },
              dotsDecorator: DotsDecorator(
                size: const Size.square(10.0),
                activeSize: const Size(20.0, 10.0),
                activeColor: Theme.of(context).colorScheme.secondary,
                color: Colors.black26,
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ColorButton(title: 'This is a title', shouldEnable: true, width: 180.w),
          const SizedBox(height: 20),
          ColorButton(title: 'This is a title', shouldEnable: false, width: 180.w),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}


class _Phone extends StatefulWidget {
  const _Phone();

  @override
  State<_Phone> createState() => _PhoneState();
}

class _PhoneState extends State<_Phone> {
  final rawPages = <Widget>[];

  @override
  void initState() {
    super.initState();

    for (int i = 1; i <= 4; i++) {
      rawPages.add(Image.asset('./lib/aitriage_core/asset/image/bg_intro_$i.png', fit: BoxFit.fitWidth));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: IntroductionScreen(
              rawPages: rawPages,
              showSkipButton: true,
              showNextButton: false,
              skip: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.w),
                  decoration: BoxDecoration(
                    color: AppColor.colorButtonBackgroundEnable,
                    borderRadius: BorderRadius.all(Radius.circular(25.w)),
                  ),
                  child: const Text("Skip", style: TextStyle(fontWeight: FontWeight.w700, color: AppColor.colorButtonTextEnable))),
              done: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.w),
                  decoration: BoxDecoration(
                    color:  AppColor.colorButtonBackgroundEnable,
                    borderRadius: BorderRadius.all(Radius.circular(25.w)),
                  ),
                  child: const Text("Done", style: TextStyle(fontWeight: FontWeight.w700, color: AppColor.colorButtonTextEnable))),
              onDone: () {
                Get.offNamed(MainRoute.main);
              },
              onSkip: () {
                // On Skip button pressed
              },
              dotsDecorator: DotsDecorator(
                size: const Size.square(10.0),
                activeSize: const Size(20.0, 10.0),
                activeColor: Theme.of(context).colorScheme.secondary,
                color: Colors.black26,
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ColorButton(title: 'This is a title', shouldEnable: true, width: 180.w),
          const SizedBox(height: 20),
          ColorButton(title: 'This is a title', shouldEnable: false, width: 180.w),
          const SizedBox(height: 200)
        ],
      ),
    );
  }
}


