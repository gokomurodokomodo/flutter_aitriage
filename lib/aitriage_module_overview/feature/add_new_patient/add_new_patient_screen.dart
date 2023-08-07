import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/screen/alert_screen.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/color_button.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_text_field.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:get/get.dart';

class AddNewPatientScreen extends StatelessWidget {
  const AddNewPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _AddNewPatientScreenTablet(),
        phone: _AddNewPatientScreenPhone()
    );
  }
}

class _AddNewPatientScreenTablet extends StatelessWidget {
  const _AddNewPatientScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _AddNewPatientScreenPhone extends StatelessWidget {
  const _AddNewPatientScreenPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  onTap: () => Get.to(() => const AlertScreen()),))
              ],
            ),
            const SizedBox(height: 20)
          ],
        ),
      )
    );
  }
}


