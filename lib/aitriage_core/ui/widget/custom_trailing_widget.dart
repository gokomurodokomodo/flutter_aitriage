import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/app_color.dart';

class CustomTrailingWidget extends StatelessWidget {
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final Widget? child;
  final double? borderRadiusValue;

  const CustomTrailingWidget({
    super.key,
    this.backgroundColor,
    this.width,
    this.height,
    required this.child,
    this.borderRadiusValue
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 40.h,
        width: width ?? 40.h,
        // padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
            color: backgroundColor ?? AppColor.colorBackgroundSearch,
            border: Border.all(color: backgroundColor ?? AppColor.colorBackgroundSearch),
            borderRadius: BorderRadius.circular(borderRadiusValue ?? 12.r)
        ),
        child: Center(child: child));
  }
}