import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 130.h),
          child: Center(
            child: (iconName == null &&
                    headerText == null &&
                    contentText == null)
                ? const SizedBox()
                : Column(
                    children: [
                      iconName == null
                          ? const SizedBox()
                          : SvgIconWidget(
                              name: iconName!,
                              size: 80.h,
                            ),
                      SizedBox(
                        height: 15.h,
                      ),
                      headerText == null
                          ? const SizedBox()
                          : Text(
                              headerText!,
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
                  ),
          ),
        )
      ],
    );
  }
}
