import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../aitriage_core/common/app_image.dart';


class AuthenticationHeader extends StatelessWidget {
  final String? iconName;
  final String? headerText;
  final String? contentText;

  const AuthenticationHeader(
      {super.key, this.iconName, this.headerText, this.contentText});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(child: SvgPicture.asset(AppImage.svgSignInSignUpBackground, height: 400.h,)),
        Padding(
          padding: EdgeInsets.only(top: 130.h),
          child: Center(
            child: (iconName == null && headerText == null && contentText == null)
                ? const SizedBox()
                : Column(
              children: [
                iconName == null
                    ? const SizedBox()
                    : SvgIconWidget(
                  name: iconName!,
                  size: 100.h,
                ),
                SizedBox(
                  height: 24.h,
                ),
                headerText == null
                    ? const SizedBox()
                    : Text(
                  headerText!,
                  style: AppStyle.styleLoginHeader,
                ),
                contentText == null
                    ? const SizedBox()
                    : Text(
                  contentText!,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}