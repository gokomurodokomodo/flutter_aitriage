import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../aitriage_core/common/app_style.dart';

class CheckBoxWithText extends StatelessWidget {
  final String? text;
  final bool isCheck;

  const CheckBoxWithText({
    super.key,
    required this.isCheck,
    this.text
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgIconWidget(name: isCheck ? AppImage.svgCheckEnabled : AppImage.svgCheckDisabled),
        SizedBox(width: 8.w),
        Text(text ?? '', style: AppStyle.styleRememberMeText)
      ],
    );
  }
}
