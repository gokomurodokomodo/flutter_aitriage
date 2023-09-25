import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/patient_detail/patient_detail_controller.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/widget/patient_detail_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/common/app_color.dart';
import '../../../aitriage_core/ui/widget/color_button.dart';
import '../../config/assessment_module_page_route.dart';

class PatientDetailScreen extends StatelessWidget {
  const PatientDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _Tablet(),
        phone: Placeholder()
    );
  }
}

class _Tablet extends GetView<PatientDetailController> {
  const _Tablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorBackgroundSearch,
      body: Column(
        children: [
          SizedBox(
              height: 80.h,
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    GestureDetector(
                        onTap: () => Get.back(id: AssessmentModulePageRoute.nestedId),
                        child: Text('Back')),
                    Spacer(),
                    ColorButton(title: 'Add assessment', width: 150.w, shouldEnableBackground: true),
                    SizedBox(width: 16.w),
                    ColorButton(title: 'Add note', width: 100.w, shouldTapAbleWhenDisable: true),
                    SizedBox(width: 16.w),
                    ColorButton(title: 'Edit', width: 80.w, shouldTapAbleWhenDisable: true),
                  ])),
          Row(
            children: [
              PatientDetailWidget(),

            ],
          )
        ],
      )
    );
  }
}

