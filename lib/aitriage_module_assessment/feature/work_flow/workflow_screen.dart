import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/color_button.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/widget/assessment_detail_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/common/app_color.dart';
import '../../../aitriage_core/common/app_image.dart';
import '../../../aitriage_core/ui/widget/base_search_bar_tablet.dart';
import '../../../aitriage_core/ui/widget/custom_app_bar.dart';
import '../../../aitriage_core/ui/widget/custom_trailing_widget.dart';
import '../../../aitriage_core/ui/widget/svg_icon_widget.dart';
import '../../widget/vital_sign_item.dart';

class WorkflowScreen extends StatelessWidget {
  const WorkflowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _Tablet(),
        phone: _Phone()
    );
  }
}

class _Tablet extends StatelessWidget {
  const _Tablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorAppBackground,
      appBar: CustomAppBar(
        title: 'ASSESSMENT WORKFLOW',
        searchBar: BaseSearchBarTablet(
          hintText: 'Search type or keyword',
          width: 350.w,
        ),
        trailing: Row(
          children: [
            CustomTrailingWidget(child: SvgIconWidget(name: AppImage.svgNotification)),
          ],
        ),
      ),
      body: Container(
        color: AppColor.colorBackgroundSearch,
        padding: EdgeInsets.all(20.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PatientDetailWidget(),
            SizedBox(width: 24.w),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 385.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColor.colorAppBackground,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Container(
                    height: 325.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColor.colorAppBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Vital Signs'),
                          SizedBox(height: 20.h),
                          Expanded(
                            child: LayoutBuilder(
                              builder: (BuildContext context, BoxConstraints constraints) {
                                final width = (constraints.maxWidth - 20.w * 3) / 4;
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    VitalSignItem(
                                        iconName: AppImage.svgSpO2,
                                        trailColor: AppColor.colorVitalSignSpo2Bg,
                                        title: 'SPO2',
                                        value: '--%',
                                        width: width,
                                        height: 176.h
                                    ),
                                    VitalSignItem(
                                        iconName: AppImage.svgHeartRate,
                                        trailColor: AppColor.colorVitalSignHeartRateBg,
                                        title: 'Heart Rate',
                                        value: '--bpm',
                                        width: width,
                                        height: 176.h
                                    ),
                                    VitalSignItem(
                                        iconName: AppImage.svgRespRate,
                                        trailColor: AppColor.colorVitalSignRespRateBg,
                                        title: 'Resp. Rate',
                                        value: '--bpm',
                                        width: width,
                                        height: 176.h
                                    ),
                                    VitalSignItem(
                                        iconName: AppImage.svgNibp,
                                        trailColor: AppColor.colorVitalSignNibpBg,
                                        title: 'NIBP',
                                        value: 'SYS--',
                                        width: width,
                                        height: 176.h
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          Row(
                            children: [
                              Text('Status: Patient monitor not connected'),
                              Spacer(),
                              ColorButton(title: ''
                                  'Connect Device',
                                  shouldEnableBackground: true,
                                  width: 160.w,
                                  height: 48.h,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Phone extends StatelessWidget {
  const _Phone({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

