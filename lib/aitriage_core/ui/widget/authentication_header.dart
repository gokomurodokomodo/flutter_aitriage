import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_color.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/app_image.dart';

class AuthenticationHeader extends StatelessWidget {
  final String? iconName;
  final String? headerText;
  final TextStyle? styleHeaderText;
  final String? contentText;
  final TextStyle? styleContentText;
  final String? thirdText;
  final TextStyle? styleThirdText;

  const AuthenticationHeader(
      {super.key,
      this.iconName,
      this.headerText,
      this.contentText,
      this.thirdText,
      this.styleHeaderText,
      this.styleContentText,
      this.styleThirdText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.colorRememberMeText.withOpacity(0.25), width: 1.w),
                borderRadius: BorderRadius.all(Radius.circular(12.w))),
            child: SvgPicture.asset(AppImage.svgEmail, width: 24.w, height: 24.w)),
        (iconName == null && headerText == null && contentText == null)
            ? const SizedBox()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  iconName == null
                      ? const SizedBox()
                      : SvgIconWidget(
                          name: iconName!,
                          size: 100.h),
                  SizedBox(height: 24.h),
                  headerText == null
                      ? const SizedBox()
                      : Text(
                          headerText!,
                          textAlign: TextAlign.center,
                          style: styleHeaderText ?? AppStyle.styleLoginHeader,
                        ),
                  contentText == null
                      ? const SizedBox()
                      : Text(
                          textAlign: TextAlign.center,
                          contentText!,
                          style: styleContentText,
                        ),
                  thirdText == null ? const SizedBox() : Text(thirdText!, style: styleThirdText,),
                ],
              )
      ],
    );
  }
}
