import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_color.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../aitriage_core/common/app_style.dart';

class RecentAssessmentsItem extends StatelessWidget {
  const RecentAssessmentsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.h),
              color: AppColor.colorAssessmentItem
            ),
            padding: EdgeInsets.all(8.h),
            child: SvgIconWidget(name: AppImage.svgAssessment, size: 24.h)),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('PATIENT001', style: AppStyle.styleAssessmentItemTitle),
              Text('05 Oct 2021, 11:39 am', style: AppStyle.styleAssessmentItemLabel)
            ],
          ),
        ),
        SizedBox(width: 8.w),
        Container(
          width: 72.w,
          height: 28.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.h),
              color: AppColor.colorAssessmentItem
          ),
          child: Center(child: Text('Low risk', style: AppStyle.styleAssessmentSummaryText)),
        )
      ],
    );
  }
}
