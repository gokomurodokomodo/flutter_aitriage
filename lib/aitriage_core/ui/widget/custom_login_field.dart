import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  final FocusNode _focusNode = FocusNode();
  CustomLoginField({
    super.key,
    this.label,
    this.hintText,
    this.labelStyle,
    this.hintStyle,
    this.textFieldRadius,
    this.textFieldWidth,
    this.textFieldHeight,
    this.onTextChange,
    this.isValidated
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label == null ? const SizedBox() : Text(label!, style: AppStyle.styleCustomTextFieldLabel,),
        label == null ? const SizedBox() : SizedBox(height: 10.h,),
        Container(
          height: textFieldHeight ?? 60.h,
          width: textFieldWidth ?? 450.w,
          decoration: BoxDecoration(
              color: AppColor.colorBackgroundSearch,
              border: Border.all(color: AppColor.colorTextFieldPlaceHoler),
              borderRadius: BorderRadius.circular(textFieldRadius ?? 8)
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: TextField(
              onChanged: (_) {
                onTextChange?.call(_);
              },
              focusNode: _focusNode,
              onTapOutside: (_) => _focusNode.unfocus(),
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