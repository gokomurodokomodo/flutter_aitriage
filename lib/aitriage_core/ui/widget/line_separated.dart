import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/app_color.dart';

class LineSeparated extends StatelessWidget {
  final double? margin;

  const LineSeparated({super.key, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: margin ?? 12.h),
      width: double.infinity,
      height: 1.h,
      color: AppColor.colorLineSeparated,
    );
  }
}
