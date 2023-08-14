import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_app_bar.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_expansion_tile_phone.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/vital_sign_chart.dart';
import 'package:flutter_aitriage/aitriage_module_overview/config/overview_route.dart';
import 'package:flutter_aitriage/aitriage_module_overview/feature/home_overview/home_overview_controller.dart';
import 'package:flutter_aitriage/aitriage_module_overview/feature/home_overview/widget/dashboard_patient_viewer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../aitriage_core/common/app_color.dart';

class HomeOverviewScreen extends StatelessWidget {
  const HomeOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _Tablet(),
        phone: _Phone()
    );
  }
}

class _Tablet extends GetView<HomeOverviewController> {
  const _Tablet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Dashboard',
        searchBar: SearchAppBar(
          placeholder: 'search type or keyword',
        ),
        trailing: Icon(Icons.notifications),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    width: Get.width,
                    height: 150.h,
                    child: Row(
                      children: [
                        const Expanded(
                          child: DashboardPatientViewer(
                            label: 'Patient',
                            amount: 10000,
                            percent: 0.05,
                            isGrowing: true,
                          ),
                        ),
                        SizedBox(width: 24.w,),
                        const Expanded(
                          child: DashboardPatientViewer(
                            label: 'Patient',
                            amount: 10000,
                            percent: 0.05,
                            isGrowing: true,
                          ),
                        ),
                        SizedBox(width: 24.w,),
                        const Expanded(
                          child: DashboardPatientViewer(
                            label: 'Patient',
                            amount: 10000,
                            percent: 0.05,
                            isGrowing: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h,),
                  Expanded(
                      child: Container(
                          color: AppColor.colorButtonTextEnable)),
                ],
              ),
            ),
            SizedBox(width: 24.w,),
            Container(
              width: Get.width / 3 * 1,
              color: AppColor.colorButtonTextEnable,
            )
          ],
        ),
      )
    );
  }
}

class _Phone extends GetView<HomeOverviewController> {
  const _Phone();

  @override
  Widget build(BuildContext context) {
    return const VitalSignChart(title: 'Test chart');

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text('Dashboard'),
            Spacer(),
            Icon(Icons.search),
            Icon(Icons.notification_important)
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 128.w,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0; i< 10; i++) Container(
                  width: 280.w,
                  color: Colors.cyanAccent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text('Patients'),
                          Spacer(),
                          Icon(Icons.people)
                        ],
                      ),
                      const Text('10,000'),
                      Container(
                        width: 71.w,
                        height: 24.w,
                        child: const Row(
                          children: [
                            Text('+0.05'),
                            Icon(Icons.arrow_upward_sharp)
                          ],
                        ),
                      )
                    ],
                  ),
                ).paddingOnly(right: 16.w)
              ],
            ),
          ),
          SizedBox(height: 10.w),
          Row(
            children: [
              const Text('All Patients'),
              const Spacer(),
              GestureDetector(
                  onTap: () => Get.toNamed(OverviewRoute.allPatients, id: OverviewRoute.nestedId),
                  child: const Text('See all'))
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                for (int i = 0; i < 10; i++) const CustomExpansionTilePhone().marginOnly(bottom: 10.w)
              ],
            ),
          )
        ],
      )
    );
  }
}


