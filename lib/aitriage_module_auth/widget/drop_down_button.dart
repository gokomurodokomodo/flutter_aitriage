import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../aitriage_core/common/app_color.dart';

class DropDownButton extends StatelessWidget {
  final double? dropDownWidth;
  final double? dropDownHeight;
  final String? title;
  final bool? shouldIncludeAsterisk;

  const DropDownButton({
    super.key,
    this.dropDownWidth,
    this.dropDownHeight,
    this.title,
    this.shouldIncludeAsterisk
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null) Text(title!, style: AppStyle.styleTextButtonBackToLogin),
            if (shouldIncludeAsterisk!) Text('*', style: AppStyle.styleTextButtonBackToLogin.copyWith(color: AppColor.colorAsterisk))
          ],
        ),
        if (title != null) SizedBox(height: 14.h),
        Container(
          width: dropDownWidth ?? 360.w,
          height: dropDownHeight ?? 44.w,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
          decoration: BoxDecoration(
              color: AppColor.colorAppBackground,
              border: Border.all(color: AppColor.colorTextFieldPlaceHolder),
              borderRadius: BorderRadius.circular(8.r)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImage.icRoundVietNam, width: 24.r, height: 24.r),
              SizedBox(width: 8.w),
              Text('VietNam', style: AppStyle.styleTextDropDownButton),
              const Spacer(),
              SvgIconWidget(name: AppImage.svgDropDownArrow, size: 16.r)
            ],
          ),
        )
      ],
    );
  }
}
