import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/app_color.dart';
import '../../common/app_style.dart';

class CustomLoginField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? labelStyle;
  final String? hintStyle;
  final double? textFieldRadius;
  final double? textFieldWidth;
  final double? textFieldHeight;
  final Function(String)? onTextChange;
  final bool? isValidated;
  final TextInputType? type;
  final bool shouldSecured;
  final bool? enableLabelAsterisk;
  final bool? enableHintTextAsterisk;

  const CustomLoginField({
    super.key,
    this.label,
    this.hintText,
    this.labelStyle,
    this.hintStyle,
    this.textFieldRadius,
    this.textFieldWidth,
    this.textFieldHeight,
    this.onTextChange,
    this.isValidated,
    this.type,
    this.shouldSecured = false,
    this.enableLabelAsterisk = false,
    this.enableHintTextAsterisk
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            label == null ? const SizedBox() : Text(label!, style: AppStyle.styleTextButtonBackToLogin,),
            if (enableLabelAsterisk!) Text('*', style: AppStyle.styleTextButtonBackToLogin.copyWith(color: AppColor.colorAsterisk))
          ],
        ),
        label == null ? const SizedBox() : SizedBox(height: 10.h,),
        Container(
          height: textFieldHeight ?? 44.h,
          width: textFieldWidth ?? 360.w,
          decoration: BoxDecoration(
              color: AppColor.colorAppBackground,
              border: Border.all(color: AppColor.colorTextFieldPlaceHolder),
              borderRadius: BorderRadius.circular(textFieldRadius ?? 8.r)
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: TextField(
              obscureText: shouldSecured ? true : false,
              enableSuggestions: shouldSecured ? false : true,
              autocorrect: shouldSecured ? false : true,
              keyboardType: type ?? TextInputType.text,
              onChanged: (_) {
                onTextChange?.call(_);
              },
              onTapOutside: (_) => Get.focusScope?.unfocus(),
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: AppStyle.styleCustomTextFieldHintText,
                  border: InputBorder.none
              ),
            ),
          ),
        ),
        isValidated == null ? const SizedBox() : isValidated == false ?const Text("Please type in valid email.") : const SizedBox()
      ],
    );
  }
}