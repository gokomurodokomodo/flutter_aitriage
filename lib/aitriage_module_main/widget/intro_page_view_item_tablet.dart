import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../aitriage_core/common/app_style.dart';
import '../../aitriage_core/ui/widget/svg_icon_widget.dart';

class IntroPageViewItemTablet extends StatelessWidget {
  final String title;
  final String label;
  final Widget intro;

  const IntroPageViewItemTablet({
    super.key,
    required this.title,
    required this.label,
    required this.intro
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 64.h),
        SvgIconWidget(
          name: AppImage.svgAppLogo,
          size: 80.h),
        SizedBox(height: 24.h),
        Text(title, style: AppStyle.styleLoginHeader),
        Text(label, style: AppStyle.styleTextLabelIntro),
        SizedBox(height: 66.h),
        SizedBox(
          height: 460.h,
          child: intro,
        )
      ],
    );
  }
}
