import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/widget/gender_with_symbol.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../aitriage_core/common/app_color.dart';
import '../../aitriage_core/common/app_style.dart';

class DashboardPatientViewer extends StatelessWidget {
  final String? label;
  final String amount;
  final String percent;
  final bool isGrowing;
  final double? width;
  final double? height;
  final Gender gender;

  const DashboardPatientViewer(
      {super.key,
      this.label,
      required this.amount,
      required this.percent,
      this.isGrowing = true,
      this.width,
      this.height,
      required this.gender});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 150.h,
      width: width ?? 300.w,
      decoration: BoxDecoration(
        color: AppColor.colorAppBackground,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GenderWithSymbol(gender: gender),
                  SizedBox(height: 8.h),
                  Text(
                    label ?? '',
                    style: AppStyle.styleDashboardPatientViewer,
                  ),
                  // Expanded(
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Expanded(child: Text(amount, style: AppStyle.styleTextDashboardTitle)),
                  //         const Spacer(),
                  //         Container(
                  //           padding: EdgeInsets.all(4.h),
                  //           decoration: BoxDecoration(
                  //             color: AppColor.colorUserProfileBackground,
                  //             borderRadius: BorderRadius.circular(8.r),
                  //           ),
                  //           child: Text(
                  //               '${isGrowing ? '+' : '-'}$percent${isGrowing ? '⬈' : '⬊'}',
                  //               style: AppStyle.styleTextTextRaisedPercent
                  //           ),
                  //         ),
                  //       ],
                  //     )
                  // ),
                ],
              ),
              const Spacer(),
              Text(amount, style: AppStyle.styleTextDashboardTitle),
            ],
          )),
    );
  }
}
