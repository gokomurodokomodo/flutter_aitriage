import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/config/assessment_module_page_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../aitriage_core/common/app_color.dart';
import '../../../aitriage_core/common/app_image.dart';
import '../../../aitriage_core/common/app_style.dart';
import '../../../aitriage_core/ui/widget/color_button.dart';
import '../../../aitriage_core/ui/widget/svg_icon_widget.dart';

class AssessmentDetailScreen extends StatelessWidget {
  const AssessmentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _Tablet(),
        phone: Placeholder()
    );
  }
}

class _Tablet extends StatefulWidget {
  const _Tablet();

  @override
  State<_Tablet> createState() => _TabletState();
}

class _TabletState extends State<_Tablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorBackgroundSearch,
      body: Column(
        children: [
          Container(
              height: 80.h,
              margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                color: AppColor.colorAppBackground,
              ),
              child: Row(mainAxisSize: MainAxisSize.max, children: [
                GestureDetector(
                    onTap: () => Get.back(
                        id: AssessmentModulePageRoute.nestedId,
                        // result: controller.vm.value.shouldReloadData
                    ),
                    child: Row(
                      children: [
                        SvgIconWidget(name: AppImage.svgArrowLeft),
                        SizedBox(width: 8.w),
                        Text('Back', style: AppStyle.styleTextUserChoice),
                      ],
                    )),
                const Spacer(),
              ])),
        ],
      ),
    );
  }
}

