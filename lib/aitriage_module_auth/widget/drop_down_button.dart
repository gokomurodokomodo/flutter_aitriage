import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/base_border_wrapper.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../aitriage_core/common/app_color.dart';

class DropDownButton extends StatelessWidget {
  final double? dropDownWidth;
  final double? dropDownHeight;
  final String? title;
  final bool? shouldIncludeAsterisk;
  final String? leftIconName;
  final String? contentText;
  final TextStyle? contentTextStyle;
  final bool? isNetworkIcon;

  const DropDownButton({
    super.key,
    this.dropDownWidth,
    this.dropDownHeight,
    this.title,
    this.shouldIncludeAsterisk,
    this.leftIconName,
    this.contentText,
    this.contentTextStyle,
    this.isNetworkIcon = false
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
            if (shouldIncludeAsterisk == true) Text('*', style: AppStyle.styleTextButtonBackToLogin.copyWith(color: AppColor.colorAsterisk))
          ],
        ),
        if (title != null) SizedBox(height: 14.h),
        BaseBorderWrapper(
          width: dropDownWidth ?? 360.w,
          height: dropDownHeight ?? 44.h,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (isNetworkIcon == true) CachedNetworkImage(
                    imageUrl: leftIconName!,
                    placeholder: (_, __) => SizedBox(width: 24.r),
                    errorWidget: (_, __, ___) => SizedBox(width: 24.r),
                    fadeInDuration: Duration.zero,
                    fadeOutDuration: Duration.zero,
                ),
                if (_isSvg == true && isNetworkIcon == false) SvgIconWidget(name: leftIconName!, size: 24.r),
                if (_isSvg == false && isNetworkIcon == false) Image.asset(leftIconName!, width: 24.r, height: 24.r),
                if (leftIconName != null) SizedBox(width: 8.w),
                Text(contentText ?? '', style: contentTextStyle ?? AppStyle.styleTextDropDownButton),
                const Spacer(),
                SvgIconWidget(name: AppImage.svgDropDownArrow, size: 16.r)
              ],
            ),
          ),
        )
      ],
    );
  }

  bool? get _isSvg => leftIconName?.contains('.svg');
}
