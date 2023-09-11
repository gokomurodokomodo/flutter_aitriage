import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/webview_widget.dart';
import 'package:flutter_aitriage/aitriage_core/util/global_function.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../aitriage_core/common/app_style.dart';

class AgreeTermAndPrivacyPolicyCheckbox extends StatefulWidget {
  final Function(bool)? onTap;
  final double? width;

  const AgreeTermAndPrivacyPolicyCheckbox({
    super.key,
    this.onTap,
    this.width
  });

  @override
  State<AgreeTermAndPrivacyPolicyCheckbox> createState() => _AgreeTermAndPrivacyPolicyCheckboxState();
}

class _AgreeTermAndPrivacyPolicyCheckboxState extends State<AgreeTermAndPrivacyPolicyCheckbox> {
  var value = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Row(
        children: [
          SizedBox(
            width: 20.r,
            height: 20.r,
            child: Checkbox(
                value: value,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.r),
                ),
                onChanged: (newValue) {
                  setState(() => value = newValue ?? false);
                  widget.onTap?.call(value);
                }
            ),
          ),
          SizedBox(width: 8.w),
          RichText(text: TextSpan(
            text: 'I agree to the ',
            style: AppStyle.styleCheckYourEmailNotification,
            children: [
              TextSpan(
                text: 'Terms ',
                style: AppStyle.styleGettingStartedItemTitle,
                recognizer: TapGestureRecognizer()..onTap = (){
                  if(systemParam.systemUrlTerms == null){
                    return;
                  } else {
                    Get.to(CustomWebviewWidget(
                      title: 'Term',
                      url: systemParam.systemUrlTerms!,
                    ));
                  }
                }
              ),
              const TextSpan(text: 'and '),
              TextSpan(
                text: 'Privacy Policy',
                  style: AppStyle.styleGettingStartedItemTitle,
                  recognizer: TapGestureRecognizer()..onTap = (){
                  if(systemParam.systemUrlPrivacyPolicy == null){
                    return;
                  } else {
                    Get.to(CustomWebviewWidget(
                      title: 'Privacy Policy',
                      url: systemParam.systemUrlPrivacyPolicy!,
                    ));
                  }
                }
              )
            ]
          ))
        ],
      ),
    );
  }
}
