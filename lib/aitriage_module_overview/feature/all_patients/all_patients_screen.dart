import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_expansion_tile_phone.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/search_textfield_phone.dart';
import 'package:flutter_aitriage/aitriage_module_overview/config/overview_route.dart';
import 'package:get/get.dart';

class AllPatientsScreen extends StatelessWidget {
  const AllPatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _AllPatientsScreenTablet(),
        phone: _AllPatientsScreenPhone()
    );
  }
}

class _AllPatientsScreenTablet extends StatelessWidget {
  const _AllPatientsScreenTablet();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _AllPatientsScreenPhone extends StatelessWidget {
  const _AllPatientsScreenPhone();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Spacer(),
            const Text('ALL PATIENTS'),
            const Spacer(),
            GestureDetector(
              // onTap: () => Get.dialog(const AddNewPatientScreen()),
                onTap: () => Get.toNamed(OverviewRoute.addNewPatients),
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


