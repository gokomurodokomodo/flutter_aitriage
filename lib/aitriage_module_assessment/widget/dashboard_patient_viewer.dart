import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
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
  final String svgIconName;
  final Color? iconBackgroundColor;

  const DashboardPatientViewer({
    super.key,
    this.label,
    required this.amount,
    required this.percent,
    this.isGrowing = true,
    this.width,
    this.height,
    required this.svgIconName,
    this.iconBackgroundColor
  });

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 40.r,
                height: 40.r,
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: iconBackgroundColor
                ),
                child: SvgIconWidget(name: svgIconName, size: 24.r)),
            SizedBox(height: 8.h),
            Text(label ?? '', style: AppStyle.styleDashboardPatientViewer,),
            SizedBox(height: 8.h),
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Text(amount, style: AppStyle.styleTextDashboardTitle)),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.all(4.h),
                      decoration: BoxDecoration(
                        color: AppColor.colorUserProfileBackground,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                          '${isGrowing ? '+' : '-'}$percent${isGrowing ? '⬈' : '⬊'}',
                          style: AppStyle.styleTextTextRaisedPercent
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}