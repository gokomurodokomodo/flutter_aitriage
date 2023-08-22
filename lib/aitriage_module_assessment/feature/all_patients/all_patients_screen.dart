import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_expansion_tile_phone.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/search_textfield_phone.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/common/app_color.dart';
import '../../config/assessment_route.dart';

class AllPatientsScreen extends StatelessWidget {
  const AllPatientsScreen({super.key});

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
        title: Row(
          children: [
            const Spacer(),
            const Text('ALL PATIENTS'),
            const Spacer(),
            GestureDetector(
              // onTap: () => Get.dialog(const AddNewPatientScreen()),
                onTap: () => Get.toNamed(AssessmentRoute.addNewPatients),
                child: const Icon(Icons.supervised_user_circle_outlined))
          ],
        ),
      ),
      body: Column(
        children: [
          const SearchTextFieldPhone(),
          Expanded(
              child: ListView(children: [
                for (int i = 0; i < 10; i++) const CustomExpansionTilePhone()
              ],)
          )
        ],
      ),
    );
  }
}


