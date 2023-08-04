import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_color.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';

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

class _GettingStartedScreenPhone extends StatefulWidget {
  const _GettingStartedScreenPhone();

  @override
  State<_GettingStartedScreenPhone> createState() => _GettingStartedScreenPhoneState();
}

class _GettingStartedScreenPhoneState extends State<_GettingStartedScreenPhone> {
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
      body: IntroductionScreen(
        rawPages: rawPages,
        showSkipButton: true,
        showNextButton: false,
        skip: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.w),
            decoration: BoxDecoration(
              color:  AppColor.colorButtonBackgroundEnable,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Text("Skip", style: TextStyle(fontWeight: FontWeight.w700, color: AppColor.colorButtonTextEnable))),
        done: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.w),
            decoration: BoxDecoration(
              color:  AppColor.colorButtonBackgroundEnable,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Text("Done", style: TextStyle(fontWeight: FontWeight.w700, color: AppColor.colorButtonTextEnable))),
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
    );
  }
}


