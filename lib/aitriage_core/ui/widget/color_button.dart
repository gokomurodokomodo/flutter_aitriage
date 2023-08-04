import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_color.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorButton extends StatelessWidget {
  final bool shouldEnable;
  final String title;
  final Function? onTap;

  const ColorButton({
    super.key,
    this.shouldEnable = false,
    this.onTap,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: 48.w,
        width: double.infinity,
        decoration: BoxDecoration(
            border: border,
            borderRadius: BorderRadius.all(Radius.circular(8.w)),
            color: borderColor
        ),
        child: Center(
          child: Text(title, style: titleStyle),
        ),
      ),
    );
  }

  BoxBorder? get border => !shouldEnable ? Border.all(color: AppColor.colorBorderDisable, width: 1.w, style: BorderStyle.solid) : null;

  Color get borderColor => shouldEnable ? AppColor.colorButtonBackgroundEnable : AppColor.colorButtonTextEnable;

  TextStyle get titleStyle => shouldEnable? AppStyle.styleTextColorButtonEnable: AppStyle.styleTextColorButtonDisable;
}
