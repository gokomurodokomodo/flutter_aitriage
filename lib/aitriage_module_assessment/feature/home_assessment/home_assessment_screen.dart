import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:get/get.dart';

class HomeAssessmentScreen extends StatelessWidget {
  const HomeAssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(2000),
      initialRoute: '/overview',
      onGenerateRoute: (_) {
        return GetPageRoute(
            settings: _,
            page: () => DeviceDetector(
                tablet: _HomeAssessmentScreenTablet(),
                phone: _HomeAssessmentScreenPhone()
            ));
      },
    );

    return const DeviceDetector(
        tablet: _HomeAssessmentScreenTablet(),
        phone: _HomeAssessmentScreenPhone()
    );
  }
}

class _HomeAssessmentScreenTablet extends StatelessWidget {
  const _HomeAssessmentScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _HomeAssessmentScreenPhone extends StatelessWidget {
  const _HomeAssessmentScreenPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () => Get.to(Scaffold(
            body: GestureDetector(
              onTap: () => Get.back(id: 1000),
              child: Container(color: Colors.black, width: 200, height: 200,),
            ),
          ), id: 1000),
          // onTap: () => Get.toNamed(AssessmentPageRoute.initialRoute),
          child: Container(width: 200, height: 200, color: Colors.red)),
    );
  }
}


