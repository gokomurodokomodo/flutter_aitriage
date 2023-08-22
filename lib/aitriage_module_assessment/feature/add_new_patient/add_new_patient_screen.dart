import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/screen/alert_screen.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/color_button.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_text_field.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:get/get.dart';

import '../../../aitriage_core/common/app_color.dart';
import '../../config/assessment_route.dart';

class AddNewPatientScreen extends StatelessWidget {
  const AddNewPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _Tablet(),
        phone: _Phone()
    );
  }
}

class _Tablet extends StatelessWidget {
  const _Tablet();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _Phone extends StatelessWidget {
  const _Phone();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorAppBackground,
      appBar: AppBar(
        title: const Text('ADD NEW PATIENT'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('MRN'),
                    CustomTextField(hintText: 'Patient999'),
                    Text('Patient name'),
                    CustomTextField(hintText: 'Patient name'),
                    Text('Phone number'),
                    CustomTextField(hintText: 'Phone number'),
                    Text('Email'),
                    CustomTextField(hintText: 'Email'),
                    Text('Date of Birth'),
                    CustomTextField(hintText: '13/06/2023', rightIcon: Icon(Icons.date_range_sharp)),
                    Text('Gender'),
                    CustomTextField(hintText: 'Select Gender', rightIcon: Icon(Icons.arrow_drop_down)),
                    Text('Race'),
                    CustomTextField(hintText: 'Select Race', rightIcon: Icon(Icons.arrow_drop_down)),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                const Expanded(child: ColorButton(title: 'Cancel')),
                const SizedBox(width: 5),
                Expanded(child: ColorButton(
                  title: 'Confirm',
                  shouldEnable: true,
                  onTap: () {

                    Get.to(() => AlertScreen(
                        onTapPrimaryButton: () {
                          Get.until((route) => route.isFirst);
                          Get.until((route) => route.settings.name == AssessmentRoute.initialRoute, id: AssessmentRoute.nestedId);
                          },
                    ));
                  }))
              ],
            ),
            const SizedBox(height: 20)
          ],
        ),
      )
    );
  }
}


