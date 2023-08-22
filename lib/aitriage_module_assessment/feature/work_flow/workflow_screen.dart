import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/color_button.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/common/app_color.dart';
import '../../../aitriage_core/common/app_image.dart';
import '../../../aitriage_core/ui/widget/base_search_bar_tablet.dart';
import '../../../aitriage_core/ui/widget/custom_app_bar.dart';
import '../../../aitriage_core/ui/widget/custom_trailing_widget.dart';
import '../../../aitriage_core/ui/widget/svg_icon_widget.dart';

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
            Container(
              height: 700.h,
              width: 325.w,
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColor.colorAppBackground,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 200.h,
                    child: Stack(
                      children: [
                        Container(
                          height: 120.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.r),
                                topRight: Radius.circular(12.r)),
                            color: Colors.blue,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 136.r,
                            height: 136.r,
                            child: Stack(
                              children: [
                                ClipOval(
                                  child: Container(
                                      width: 136.r,
                                      height: 136.r,
                                      color: Colors.red
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 5.r,
                                  child: ClipOval(
                                    child: Container(
                                      width: 32.r,
                                      height: 32.r,
                                      color: AppColor.colorButtonBackgroundEnable,
                                      child: Center(
                                          child: SvgIconWidget(
                                            name: AppImage.svgMaleWhiteBg,
                                             size: 16.r)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text('Patient009', style: AppStyle.styleTextDialogTitle),
                  SizedBox(height: 8.h),
                  Text('African American', style: AppStyle.styleTextButtonBackToLogin),
                  SizedBox(height: 8.h),
                  Text('12-07-1993 (20y1m)', style: AppStyle.styleTextButtonBackToLogin),
                  SizedBox(height: 8.h),
                  ColorButton(
                      title: 'Add note',
                      shouldEnable: true,
                      width: 118.w,
                      leftIcon: SvgIconWidget(
                          name: AppImage.svgPlus,
                          size: 20.r,
                          color: AppColor.colorAppBackground).marginOnly(right: 10.w)),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.h),
                    width: double.infinity,
                    height: 1.h,
                    color: AppColor.colorInactiveFillColor,
                  ),
                  CustomTrailingWidget(
                      height: 48.h,
                      width: double.infinity,
                      backgroundColor: AppColor.colorRailHover,
                      child: Row(
                        children: [
                          SizedBox(width: 12.w),
                          SvgIconWidget(name: AppImage.svgRecordVitalSigns),
                          SizedBox(width: 20.w),
                          Text('Record vital signs', style: AppStyle.styleRecordVitalSignsActive)
                        ]
                      )
                  ),
                  SizedBox(height: 16.h),
                  CustomTrailingWidget(
                      height: 48.h,
                      width: double.infinity,
                      backgroundColor: AppColor.colorAppBackground,
                      child: Row(
                          children: [
                            SizedBox(width: 12.w),
                            SvgIconWidget(name: AppImage.svgHearScore),
                            SizedBox(width: 20.w),
                            Text('HEAR Score', style: AppStyle.styleRecordVitalSignsInactive)
                          ]
                      )
                  ),
                  SizedBox(height: 16.h),
                  CustomTrailingWidget(
                      height: 48.h,
                      width: double.infinity,
                      backgroundColor: AppColor.colorAppBackground,
                      child: Row(
                          children: [
                            SizedBox(width: 12.w),
                            SvgIconWidget(name: AppImage.svgAssessmentResult),
                            SizedBox(width: 20.w),
                            Text('Assessment Results', style: AppStyle.styleRecordVitalSignsInactive)
                          ]
                      )
                  ),
                  const Spacer(),
                  CustomTrailingWidget(
                      height: 48.h,
                      width: double.infinity,
                      backgroundColor: AppColor.colorBackgroundSearch,
                      child: Center(child: Text('Cancel Assessment', style: AppStyle.styleCancelAssessment))
                  ),
                ],
              ),
            ),
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

