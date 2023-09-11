import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/base_border_wrapper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/app_color.dart';
import '../../common/app_style.dart';

class CustomLoginField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextStyle? labelStyle;
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
  final String? unvalidateText;
  final Function? onTapOutside;
  final RegExp? textInputFormatter;
  final bool shouldHaveTrailingIcon;
  final Function? onSwitchPasswordView;
  final bool sercurePassword;
  final TextEditingController? controller;

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
    this.enableHintTextAsterisk,
    this.unvalidateText,
    this.onTapOutside,
    this.textInputFormatter,
    this.shouldHaveTrailingIcon = false,
    this.onSwitchPasswordView,
    this.sercurePassword = true,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            label == null ? const SizedBox() : Text(label!, style: labelStyle ?? AppStyle.styleTextButtonBackToLogin,),
            if (enableLabelAsterisk!) Text('*', style: AppStyle.styleTextButtonBackToLogin.copyWith(color: AppColor.colorAsterisk))
          ],
        ),
        label == null ? const SizedBox() : SizedBox(height: 10.h,),
        Stack(
          alignment: Alignment.centerRight,
          children: [
            BaseBorderWrapper(
              height: textFieldHeight ?? 44.h,
              width: textFieldWidth ?? 360.w,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: TextField(
                  controller: controller,
                  inputFormatters: textInputFormatter == null 
                      ? null 
                      : <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(textInputFormatter!)
                      ],
                  obscureText: shouldSecured ? true : false,
                  enableSuggestions: shouldSecured ? false : true,
                  autocorrect: shouldSecured ? false : true,
                  keyboardType: type ?? TextInputType.text,
                  onChanged: (_) {
                    onTextChange?.call(_);
                  },
                  onTapOutside: (_) {
                    onTapOutside?.call();
                    Get.focusScope?.unfocus();
                  },
                  decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: AppStyle.styleCustomTextFieldHintText,
                      border: InputBorder.none
                  ),
                ),
              ),
            ),
            Visibility(
              visible: shouldHaveTrailingIcon,
              child: SizedBox(
                width: 50.w,
                child: InkWell(
                onTap: (){
                  onSwitchPasswordView?.call();
                },
                child: Container(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Icon(
                    sercurePassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black87,
                    ),
                ),
              ),
                      ),
            ),
          ],
        ),
        SizedBox(height: 5.h,),
        isValidated == null 
            ? const SizedBox() 
            : isValidated == false 
                ? unvalidateText == null 
                    ? const SizedBox() 
                    : Text(unvalidateText!, style: AppStyle.styleErrorText,)
                : const SizedBox()
      ],
    );
  }
}