import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/dialog/app_dialog.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/base_search_bar_tablet.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/color_button.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/line_separated.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/patient_summary_listview.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/vital_sign_chart.dart';
import 'package:flutter_aitriage/aitriage_core/util/alert/alert_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/common/app_color.dart';
import '../../../aitriage_core/ui/widget/custom_trailing_widget.dart';
import '../../widget/gender_with_symbol.dart';
import '../../config/patient_module_page_route.dart';
import '../../../aitriage_core/ui/widget/dashboard_item_view.dart';
import 'package:number_paginator/number_paginator.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(tablet: _Tablet(), phone: _Phone());
  }
}

class _Tablet extends StatefulWidget {
  const _Tablet();

  @override
  State<_Tablet> createState() => _TabletState();
}

class _TabletState extends State<_Tablet> {
  final _pageController = NumberPaginatorController();
  final controller = Get.find<HomeController>();

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
                              Obx(() => DashboardItemView(
                                    icon: const GenderWithSymbol(gender: Gender.patients),
                                    width: itemWidth,
                                    label: 'Patients',
                                    amount: controller.vm.value.totalPatient.toString())),
                              SizedBox(width: 24.w),
                              Obx(() => DashboardItemView(
                                    icon: const GenderWithSymbol(gender: Gender.male),
                                    width: itemWidth,
                                    label: 'Male',
                                    amount: controller.vm.value.totalMale.toString())),
                              SizedBox(width: 24.w),
                              Obx(() => DashboardItemView(
                                    icon: const GenderWithSymbol(gender: Gender.female),
                                    width: itemWidth,
                                    label: 'Female',
                                    amount: controller.vm.value.totalFemale.toString())),
                            ],
                          );
                        },
                      )),
                  SizedBox(height: 24.h),
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
                              hintText: 'Search...',
                              onTextChange: (text) {
                                controller.onSearchTextFieldChanged(
                                    text,
                                    onSuccess: () => _pageController.currentPage = 0);
                              },
                            ),
                            SizedBox(width: 16.w),
                            CustomTrailingWidget(child: SvgIconWidget(name: AppImage.svgFilter, size: 24.r)),
                            const Spacer(),
                            ColorButton(
                              title: 'Add new',
                              shouldEnableBackground: true,
                              onTap: () async {
                                bool isAddSuccess = false;
                                isAddSuccess = await Get.toNamed(
                                    PatientModulePageRoute.addNewPatients);
                                if (isAddSuccess) {
                                  _showDialog();
                                  controller.reloadCurrentPage();
                                }
                              },
                              width: 102.w,
                            ) // SizedBox(width: 16.w)
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Expanded(
                            child: Obx(() => PatientSummaryListView(
                                onTapPatient: (patientId) async {
                                  final result = await Get.toNamed(
                                      PatientModulePageRoute.patientDetail,
                                      id: PatientModulePageRoute.nestedId,
                                      arguments: {'patientId': patientId});

                                  if (result == true) {
                                    controller.reloadCurrentPage();
                                  }
                                },
                                list:
                                    controller.vm.value.listPatientSummaryVM))),
                        LineSeparated(margin: 16.h),
                        Row(
                          children: [
                            Obx(() => Text(
                              // controller.showCountPatient.value,
                              controller.vm.value.pageCountString,
                              style: AppStyle.styleRememberMeText,
                            )),
                            const Spacer(),
                            Obx(() => Align(
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                    height: 50.w,
                                    ///Tính chiều rộng động. 20 là tổng padding giữa 2 dấu mũi tên.
                                    ///100 là tổng khoảng cách của 2 ô mũi tên, do trong thư viện set height = width
                                    ///nên set cứng height là 50.w để lấy khoảng cách.
                                    ///50 * totalPage để tính độ rộng cần thiết cho content ở giữa.
                                    width: (50 * controller.vm.value.totalPage).toDouble().w
                                        + 20.w + 100.w,
                                    child: StatefulBuilder(
                                      builder: (_, setState) {
                                        if (controller.vm.value.totalPage < 1) {
                                          return const CircularProgressIndicator();
                                        } else {
                                          return NumberPaginator(
                                            numberPages: controller.vm.value.totalPage,
                                            onPageChange: (value) {
                                              setState(() {});
                                              AlertUtil
                                                  .showLoadingIndicator();
                                              controller.onTapNumberPaginator(
                                                  value,
                                                  onSuccess: () => Get.back(),
                                                  onError: (message) {
                                                    Get.back();
                                                    Get.snackbar(
                                                        'Error', message);
                                                  });
                                            },
                                            controller: _pageController,
                                            config: NumberPaginatorUIConfig(
                                                contentPadding:
                                                const EdgeInsets.all(0),
                                                buttonShape:
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      8.r),
                                                )),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              )),
        ));
  }
}

class _Phone extends GetView<HomeController> {
  const _Phone();

  @override
  Widget build(BuildContext context) {
    return const VitalSignChart(title: 'Test chart');

    // return Scaffold(
    //     appBar: AppBar(
    //       title: const Row(
    //         children: [
    //           Text('Dashboard'),
    //           Spacer(),
    //           Icon(Icons.search),
    //           Icon(Icons.notification_important)
    //         ],
    //       ),
    //     ),
    //     body: Column(
    //       children: [
    //         SizedBox(
    //           height: 128.w,
    //           child: ListView(
    //             scrollDirection: Axis.horizontal,
    //             children: [
    //               for (int i = 0; i < 10; i++)
    //                 Container(
    //                   width: 280.w,
    //                   color: Colors.cyanAccent,
    //                   child: Column(
    //                     mainAxisSize: MainAxisSize.min,
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       const Row(
    //                         children: [
    //                           Text('Patients'),
    //                           Spacer(),
    //                           Icon(Icons.people)
    //                         ],
    //                       ),
    //                       const Text('10,000'),
    //                       Container(
    //                         width: 71.w,
    //                         height: 24.w,
    //                         child: const Row(
    //                           children: [
    //                             Text('+0.05'),
    //                             Icon(Icons.arrow_upward_sharp)
    //                           ],
    //                         ),
    //                       )
    //                     ],
    //                   ),
    //                 ).paddingOnly(right: 16.w)
    //             ],
    //           ),
    //         ),
    //         SizedBox(height: 10.w),
    //         Row(
    //           children: [
    //             const Text('All Patients'),
    //             const Spacer(),
    //             GestureDetector(
    //                 onTap: () => Get.toNamed(
    //                     AssessmentModulePageRoute.allPatients,
    //                     id: AssessmentModulePageRoute.nestedId),
    //                 child: const Text('See all'))
    //           ],
    //         ),
    //         Expanded(
    //           child: ListView(
    //             children: [
    //               for (int i = 0; i < 10; i++)
    //                 const CustomExpansionTilePhone().marginOnly(bottom: 10.w)
    //             ],
    //           ),
    //         )
    //       ],
    //     ));
  }
}

void _showDialog() {
  Get.dialog(
    AppDialog(
      content: Column(
        children: [
          SizedBox(height: 20.h),
          const Divider(
            color: AppColor.colorInactiveFillColor,
          ),
          SizedBox(height: 20.h),
          SvgIconWidget(size: 64.r, name: AppImage.svgIconSuccessDialog),
          SizedBox(height: 20.h),
          Text('Patient Added Successfully.',
              style: AppStyle.styleTextColorButtonDisable),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
      title: 'CONGRATULATIONS',
      primaryButtonCallback: () => Get.back(),
      primaryButtonTitle: 'Continue',
    ),
  );
}
