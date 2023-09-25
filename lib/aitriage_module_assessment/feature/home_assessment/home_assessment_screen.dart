import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/base_search_bar_tablet.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/color_button.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_app_bar.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_expansion_tile_phone.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/line_separated.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/patient_summary_listview.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/vital_sign_chart.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/home_assessment/home_assessment_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/common/app_color.dart';
import '../../../aitriage_core/ui/widget/custom_trailing_widget.dart';
import '../../config/assessment_module_page_route.dart';
import '../../widget/dashboard_patient_viewer.dart';
import '../../widget/gender_with_symbol.dart';
import 'package:number_paginator/number_paginator.dart';

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
      body: Container(
        color: AppColor.colorBackgroundSearch,
        child: Padding(
          padding: EdgeInsets.all(24.w),
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
                          Obx(() => DashboardPatientViewer(
                            gender: Gender.patients,
                            width: itemWidth,
                            label: 'Patients',
                            amount: controller.vm.value.totalPatient.toString(),
                            percent: '0.05',
                            isGrowing: true,
                          )),
                          SizedBox(width: 24.w),
                          Obx(() => DashboardPatientViewer(
                            gender: Gender.male,
                            width: itemWidth,
                            label: 'Male',
                            amount: controller.vm.value.totalMale.toString(),
                            percent: '0.05',
                            isGrowing: true,
                          )),
                          SizedBox(width: 24.w),
                          Obx(() => DashboardPatientViewer(
                            gender: Gender.female,
                            width: itemWidth,
                            label: 'Female',
                            amount: controller.vm.value.totalFemale.toString(),
                            percent: '0.05',
                            isGrowing: false,
                          )),
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
                            BaseSearchBarTablet(
                                width: 320.w,
                                hintText: 'Search type or keyword',
                                onTextChange: (text) => controller.onSearchTextFieldChanged(text),
                            ),
                            SizedBox(width: 16.w),
                            CustomTrailingWidget(child: SvgIconWidget(name: AppImage.svgFilter, size: 24.r)),
                            const Spacer(),
                            ColorButton(
                              title: 'Add new',
                              shouldEnableBackground: true,
                              // onTap: () => Get.toNamed(AssessmentRoute.workflow, id: AssessmentRoute.nestedId),
                              onTap: () => Get.toNamed(AssessmentModulePageRoute.addNewPatients),
                              width: 102.w,
                            ) // SizedBox(width: 16.w)
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Expanded(
                            child: Obx(() => PatientSummaryListView(list: controller.vm.value.listPatientSummaryVM))
                        ),
                        LineSeparated(margin: 16.h),
                        Align(
                          alignment: Alignment.topRight,
                          child: SizedBox(
                            width: 400.w,
                            child: StatefulBuilder(
                              builder: (_,setState) {
                                return Obx(() => NumberPaginator(
                                  numberPages: controller.vm.value.totalPage,
                                  onPageChange: (value) {
                                    setState((){});
                                    controller.onTapNumberPaginator(value);
                                  },
                                  config: NumberPaginatorUIConfig(
                                      buttonShape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.r),
                                      )
                                  ),
                                ));
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          )
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
                  onTap: () => Get.toNamed(AssessmentModulePageRoute.allPatients, id: AssessmentModulePageRoute.nestedId),
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


