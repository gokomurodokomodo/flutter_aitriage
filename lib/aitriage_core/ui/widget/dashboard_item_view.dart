import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/app_color.dart';
import '../../common/app_style.dart';
import '../../../aitriage_module_patient/widget/gender_with_symbol.dart';

class DashboardItemView extends StatelessWidget {
  final String? label;
  final String amount;
  final double? width;
  final double? height;
  final Widget icon;

  const DashboardItemView({
      super.key,
      this.label,
      required this.amount,
      this.width,
      this.height,
      required this.icon
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  icon,
                  SizedBox(height: 8.h),
                  Text(
                    label ?? '',
                    style: AppStyle.styleDashboardPatientViewer,
                  ),
                ],
              ),
              const Spacer(),
              Text(amount, style: AppStyle.styleTextDashboardTitle),
            ],
          )),
    );
  }
}
