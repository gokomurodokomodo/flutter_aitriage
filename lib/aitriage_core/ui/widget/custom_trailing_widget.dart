import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/app_color.dart';

class CustomTrailingWidget extends StatelessWidget {
  final String svgIconName;

  const CustomTrailingWidget({
    super.key,
    required this.svgIconName
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40.h,
        width: 40.h,
        padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
            color: AppColor.colorBackgroundSearch,
            border: Border.all(color: AppColor.colorBackgroundSearch),
            borderRadius: BorderRadius.circular(12.r)
        ),
        child: SvgIconWidget(name: svgIconName));
  }
}