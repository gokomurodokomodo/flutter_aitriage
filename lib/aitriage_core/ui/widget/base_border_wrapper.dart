import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/app_color.dart';

class BaseBorderWrapper extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;

  const BaseBorderWrapper({
    super.key,
    this.child,
    this.width,
    this.height
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: AppColor.colorAppBackground,
          border: Border.all(color: AppColor.colorTextFieldPlaceHolder),
          borderRadius: BorderRadius.circular(8.r)
      ),
      child: child,
    );
  }
}
