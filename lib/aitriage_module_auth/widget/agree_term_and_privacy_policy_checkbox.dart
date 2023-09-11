import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/webview_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../aitriage_core/common/app_style.dart';

class AgreeTermAndPrivacyPolicyCheckbox extends StatefulWidget {
  final Function(bool)? onTap;
  final double? width;
  final bool passedValue;
  final String? termUrl;
  final String? privacyUrl;

  const AgreeTermAndPrivacyPolicyCheckbox({
    super.key,
    this.onTap,
    this.width,
    this.passedValue = false,
    this.termUrl,
    this.privacyUrl
  });

  @override
  State<AgreeTermAndPrivacyPolicyCheckbox> createState() => _AgreeTermAndPrivacyPolicyCheckboxState();
}

class _AgreeTermAndPrivacyPolicyCheckboxState extends State<AgreeTermAndPrivacyPolicyCheckbox> {
  var mainValue = false;

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
                value: widget.passedValue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.r),
                ),
                onChanged: (newValue) {
                  setState(() => mainValue = newValue ?? false);
                  widget.onTap?.call(mainValue);
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
                  if(widget.termUrl == null){
                    return;
                  } else {
                    Get.to(CustomWebviewWidget(
                      title: 'Term',
                      url: widget.termUrl!,
                    ));
                  }
                }
              ),
              const TextSpan(text: 'and '),
              TextSpan(
                text: 'Privacy Policy',
                  style: AppStyle.styleGettingStartedItemTitle,
                  recognizer: TapGestureRecognizer()..onTap = (){
                  if(widget.privacyUrl == null){
                    return;
                  } else {
                    Get.to(CustomWebviewWidget(
                      title: 'Privacy Policy',
                      url: widget.privacyUrl!,
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
