import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../aitriage_core/common/app_color.dart';

class SignInDivider extends StatelessWidget {
  final double? width;
  final Alignment? alignment;
  final String? text;
  final TextStyle? textStyle;

  const SignInDivider({
    super.key,
    this.width,
    this.alignment,
    this.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 340.w,
      child: Stack(
        alignment: alignment ?? Alignment.center,
        children: [
          const Divider(color: AppColor.colorInactiveFillColor,thickness: 2,),
          Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 12.w, right: 12.w),
              child: Text(text ?? 'OR', style: textStyle ?? const TextStyle(decoration: TextDecoration.underline),))
        ],
      ),
    );
  }
}