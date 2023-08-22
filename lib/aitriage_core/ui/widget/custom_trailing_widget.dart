import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/app_color.dart';

class CustomTrailingWidget extends StatelessWidget {
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final Widget? child;

  const CustomTrailingWidget({
    super.key,
    this.backgroundColor,
    this.width,
    this.height,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 40.h,
        width: width ?? 40.h,
        padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
            color: backgroundColor ?? AppColor.colorBackgroundSearch,
            border: Border.all(color: backgroundColor ?? AppColor.colorBackgroundSearch),
            borderRadius: BorderRadius.circular(12.r)
        ),
        child: child);
  }
}