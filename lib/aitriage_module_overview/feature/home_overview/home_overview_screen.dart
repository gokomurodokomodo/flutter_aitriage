import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_app_bar.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_expansion_tile_phone.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/vital_sign_chart.dart';
import 'package:flutter_aitriage/aitriage_module_overview/config/overview_route.dart';
import 'package:flutter_aitriage/aitriage_module_overview/feature/home_overview/home_overview_controller.dart';
import 'package:flutter_aitriage/aitriage_module_overview/widget/dashboard_patient_viewer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/common/app_color.dart';
import '../../widget/recent_assessments_item.dart';

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
      backgroundColor: AppColor.colorAppBackground,
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
              flex: 6,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 150.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, __) => const DashboardPatientViewer(
                        label: 'Patient',
                        amount: 10000,
                        percent: 0.05,
                        isGrowing: true,
                      ),
                      separatorBuilder: (_, __) => SizedBox(width: 24.w),
                      itemCount: 6,
                    ),
                  ),
                  SizedBox(height: 24.h,),
                  Expanded(child: Container(color: AppColor.colorAppBackground)),
                ],
              ),
            ),
            SizedBox(width: 24.w,),
            Expanded(
              flex: 3,
              child: Container(
                color: AppColor.colorAppBackground,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  children: [
                    Text('Recent Assessments', style: AppStyle.styleTextDialogTitle),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (_, __) => const RecentAssessmentsItem(),
                          separatorBuilder: (_, __) => SizedBox(height: 20.h),
                          itemCount: 20
                      ),
                    )
                  ],
                ),
              ),
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


