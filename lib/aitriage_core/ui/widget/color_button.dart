import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_color.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorButton extends StatelessWidget {
  final bool shouldEnable;
  final double? height;
  final double? width;
  final String title;
  final Decoration? decoration;
  final Function? onTap;
  final TextStyle? textStyle;
  final Color? colorActive;
  final Widget? leftIcon;

  const ColorButton({
    super.key,
    this.shouldEnable = false,
    this.height,
    this.width,
    this.onTap,
    this.decoration,
    this.textStyle,
    this.colorActive,
    required this.title,
    this.leftIcon
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: _height,
        width: _width,
        decoration: _decoration,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leftIcon != null) leftIcon!,
              Text(title, style: _textStyle)
            ],
          ),
        ),
      ),
    );
  }

  BoxBorder? get _border => !shouldEnable ? Border.all(color: AppColor.colorBorderDisable, width: 1.w, style: BorderStyle.solid) : Border.all(color: colorActive == null ? Colors.transparent : AppColor.colorBorderDisable, width: 1.w, style: BorderStyle.solid);

  Color get _borderColor => shouldEnable ? AppColor.colorButtonBackgroundEnable : AppColor.colorAppBackground;

  TextStyle get titleStyle => shouldEnable ? AppStyle.styleTextColorButtonEnable: AppStyle.styleTextColorButtonDisable;

  double get _height => height != null ?  height! : 48.h;

  double get _width => width != null ? width! : double.infinity;

  Decoration get _decoration => decoration != null
      ? decoration!
      : BoxDecoration(
          border: _border,
          borderRadius: BorderRadius.all(Radius.circular(8.w)),
          color: colorActive ?? _borderColor);

  TextStyle get _textStyle => textStyle != null ? textStyle! : titleStyle;
}
