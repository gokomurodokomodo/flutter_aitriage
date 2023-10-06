import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_trailing_widget.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../aitriage_core/common/app_color.dart';

class VitalSignItem extends StatelessWidget {
  final double? width;
  final double? height;
  final String iconName;
  final String? title;
  final String? value;
  final Color? trailColor;

  const VitalSignItem({
    super.key,
    this.width,
    this.height,
    required this.iconName,
    this.title,
    this.value,
    this.trailColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.h),
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.colorInactiveFillColor),
          borderRadius: BorderRadius.circular(12.r)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTrailingWidget(
              backgroundColor: trailColor,
              child: SvgIconWidget(name: iconName)),
          SizedBox(height: 4.h),
          Text(title ?? ''),
          Text(value ?? '')
        ],
      ),
    );
  }
}
