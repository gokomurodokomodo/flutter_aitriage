import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../aitriage_core/common/app_color.dart';

class InputPinCode extends StatelessWidget{
  final int? lengthCode;
  final bool? shouldHideCode;
  final AnimationType? animationType;
  final PinCodeFieldShape? pinCodeFieldShape;
  final BorderRadius? borderRadius;
  final double? fieldHeight;
  final double? fieldWidth;
  final Color? activeFillColor;
  final Duration? animationDuration;
  final Color? backgroundColor;
  final bool? enableActiveFill;
  final Function(String)? onComplete;
  final Function(String)? onChange;
  final Function(String)? beforeTextPaste;
  final BuildContext appContext;

  const InputPinCode(
      {super.key,
      this.lengthCode,
      this.shouldHideCode,
      this.animationType,
      this.pinCodeFieldShape,
      this.borderRadius,
      this.fieldHeight,
      this.fieldWidth,
      this.activeFillColor,
      this.animationDuration,
      this.backgroundColor,
      this.enableActiveFill,
      this.onComplete,
      this.onChange,
      this.beforeTextPaste,
      required this.appContext});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: false),
      textStyle: TextStyle(color: AppColor.colorTextPinCode, fontSize: AppStyle.fontSize5XL),
      length: lengthCode ?? 6,
      obscureText: shouldHideCode ?? false,
      animationType: animationType ?? AnimationType.fade,
      pinTheme: PinTheme(
        inactiveFillColor: Colors.white,
        inactiveColor: AppColor.colorInactiveFillColor,
        selectedFillColor: Colors.white,
        selectedColor: Colors.blue,
        activeColor: AppColor.colorInactiveFillColor,
        shape: pinCodeFieldShape ?? PinCodeFieldShape.box,
        borderRadius: borderRadius ?? BorderRadius.circular(5),
        fieldHeight: fieldHeight ?? 50,
        fieldWidth: fieldWidth ?? 40,
        activeFillColor: activeFillColor ?? Colors.white,
      ),
      animationDuration: animationDuration ?? const Duration(milliseconds: 300),
      backgroundColor: backgroundColor ?? Colors.blue.shade50,
      enableActiveFill: enableActiveFill ?? true,
      onCompleted: (v) {
        onComplete?.call(v);
      },
      onChanged: (value) {
        final pattern = RegExp(r'^[0-9]+$');
        if(pattern.hasMatch(value)){
          onChange?.call(value);
        }
      },
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly
      ],
      beforeTextPaste: (text) {
        return true;
      },
      appContext: context,
    );
  }

}