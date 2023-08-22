import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/base_search_bar_tablet.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_app_bar.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_expansion_tile_phone.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/patient_summary_listview.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/vital_sign_chart.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/home_assessment/home_assessment_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/common/app_color.dart';
import '../../../aitriage_core/ui/widget/custom_trailing_widget.dart';
import '../../config/assessment_route.dart';
import '../../widget/dashboard_patient_viewer.dart';
import '../../widget/recent_assessments_item.dart';

class HomeAssessmentScreen extends StatelessWidget {
  const HomeAssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _Tablet(),
        phone: _Phone()
    );
  }
}

class _Tablet extends GetView<HomeAssessmentController> {
  const _Tablet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorAppBackground,
      appBar: CustomAppBar(
        title: 'Dashboard',
        searchBar: BaseSearchBarTablet(
          hintText: 'Search type or keyword',
          width: 350.w,
        ),
        trailing: Row(
          children: [
            const CustomTrailingWidget(svgIconName: AppImage.svgNotification),
            SizedBox(width: 20.w),
            const CustomTrailingWidget(svgIconName: AppImage.svgGift),
            SizedBox(width: 20.w),
            const CustomTrailingWidget(svgIconName: AppImage.svgShare),
          ],
        ),
      ),
      body: Container(
        color: AppColor.colorBackgroundSearch,
        child: Padding(
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
                      child: LayoutBuilder(
                        builder: (_, constraints) {
                          final itemWidth = (constraints.maxWidth - 48.w) / 3;
                          return Row(
                            children: [
                              DashboardPatientViewer(
                                svgIconName: AppImage.svgProfileUser,
                                iconBackgroundColor: AppColor.colorUserProfileBackground,
                                width: itemWidth,
                                label: 'Patient',
                                amount: '10,000',
                                percent: '0.05',
                                isGrowing: true,
                              ),
                              SizedBox(width: 24.w),
                              DashboardPatientViewer(
                                svgIconName: AppImage.svgProfileMale,
                                iconBackgroundColor: AppColor.colorRailHover,
                                width: itemWidth,
                                label: 'Male',
                                amount: '5,600',
                                percent: '0.05',
                                isGrowing: true,
                              ),
                              SizedBox(width: 24.w),
                              DashboardPatientViewer(
                                svgIconName: AppImage.svgProfileFemale,
                                iconBackgroundColor: AppColor.colorFemaleProfileBackground,
                                width: itemWidth,
                                label: 'Female',
                                amount: '4,400',
                                percent: '0.05',
                                isGrowing: false,
                              ),
                            ],
                          );
                        },
                      )
                    ),
                    SizedBox(height: 24.h,),
                    Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: AppColor.colorAppBackground,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('All Patients', style: AppStyle.styleTextAllPatientsHeader),
                                      Text('Patients enrolled: 12', style: AppStyle.styleRememberMeText)
                                    ],
                                  ),
                                  const Spacer(),
                                  BaseSearchBarTablet(
                                    width: 320.w,
                                    hintText: 'Search type or keyword'),
                                  SizedBox(width: 16.w),
                                  const CustomTrailingWidget(svgIconName: AppImage.svgFilter),
                                  SizedBox(width: 16.w),
                                  const CustomTrailingWidget(svgIconName: AppImage.svgAddPatient),
                                  // SizedBox(width: 16.w)
                                ],
                              ),
                              SizedBox(height: 20.h),
                              const Expanded(
                                  child: PatientSummaryListView()
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(width: 24.w,),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColor.colorAppBackground,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Recent Assessments', style: AppStyle.styleTextDialogTitle),
                          const Spacer(),
                          const CustomTrailingWidget(svgIconName: AppImage.svgAddAssessment),
                        ],
                      ),
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
        ),
      )
    );
  }
}

class _Phone extends GetView<HomeAssessmentController> {
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
                  onTap: () => Get.toNamed(AssessmentRoute.allPatients, id: AssessmentRoute.nestedId),
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


