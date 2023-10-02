import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final RegExp? textInputRegex;
  final bool shouldHaveTrailingIcon;
  final Function? onSwitchPasswordView;
  final bool sercurePassword;
  final TextEditingController? controller;
  final Function? onTapInside;
  final bool shouldAddBorder;
  final bool enableBorder;
  final TextInputFormatter? textInputFormatter;
  final Widget? prefixIcon;
  final bool shouldHavePrefixIcon;
  final TextAlignVertical textAlignVertical;
  final int maxLines;
  final EdgeInsets? multiLineContentPadding;

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
    this.textInputRegex,
    this.shouldHaveTrailingIcon = false,
    this.onSwitchPasswordView,
    this.sercurePassword = true,
    this.controller,
    this.onTapInside,
    this.shouldAddBorder = false,
    this.enableBorder = false,
    this.textInputFormatter,
    this.shouldHavePrefixIcon = false,
    this.prefixIcon,
    this.textAlignVertical = TextAlignVertical.center,
    this.maxLines = 1,
    this.multiLineContentPadding
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
            Container(
              height: textFieldHeight ?? 44.h,
              width: textFieldWidth ?? 360.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: (shouldAddBorder && enableBorder) ? AppColor.colorTextCancelAssessment : AppColor.colorTextFieldPlaceHolder
                ),
                borderRadius: BorderRadius.circular(8.w),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: (shouldHavePrefixIcon && prefixIcon != null) ? 0.w : 16.w),
                  child: TextField(
                    //if somethings prevent push textfield align fron center to top, set maxline > 1 do the trick.
                    maxLines: maxLines,
                    controller: controller,
                    inputFormatters: <TextInputFormatter>[
                          if (textInputRegex != null) FilteringTextInputFormatter.allow(textInputRegex!),
                          if (textInputFormatter != null) textInputFormatter!,
                        ],
                    obscureText: shouldSecured ? true : false,
                    enableSuggestions: shouldSecured ? false : true,
                    autocorrect: shouldSecured ? false : true,
                    keyboardType: type ?? TextInputType.text,
                    textAlignVertical: textAlignVertical,
                    textAlign: TextAlign.left,
                    
                    onChanged: (_) {
                      onTextChange?.call(_);
                    },
                    onTap: (){
                      onTapInside?.call();
                    },
                    onTapOutside: (_) {
                      onTapOutside?.call();
                      Get.focusScope?.unfocus();
                    },
                    decoration: InputDecoration(
                      //nếu có prefix icon hoặc trailing icon, thêm thuộc tính dưới nếu không textfield bị đẩy xuống dưới.
                        isCollapsed: true,
                        prefixIcon: (shouldHavePrefixIcon && prefixIcon != null) ? Padding(padding: EdgeInsetsDirectional.only(end: 16.w) ,child: prefixIcon) : null,
                        hintText: hintText,
                        hintStyle: AppStyle.styleCustomTextFieldHintText,
                        border: InputBorder.none,
                        contentPadding: multiLineContentPadding
                    ),
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
                child: Icon(
                  sercurePassword ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black87,
                  size: 20.w,
                  ),
              ),
                      ),
            ),
          ],
        ),
        SizedBox(height: 3.h,),
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