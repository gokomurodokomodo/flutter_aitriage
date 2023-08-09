import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/color_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppDialog extends StatelessWidget {
  final Widget content;
  final String title;
  // if primaryButtonTitle not null and not empty, show this widget
  // same for secondaryButtonTitle
  final String? primaryButtonTitle;
  final String? secondaryButtonTitle;
  final Function? primaryButtonCallback;
  final Function? secondaryButtonCallback;

  const AppDialog({
    super.key,
    required this.content,
    required this.title,
    this.primaryButtonCallback,
    this.secondaryButtonCallback,
    this.primaryButtonTitle,
    this.secondaryButtonTitle
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h),
          Row(
            children: [
              SizedBox(width: 48.w),
              Expanded(child: Center(child: Text(title, style: AppStyle.styleTextDialogTitle))),
              GestureDetector(
                  onTap: () => Get.back(),
                  child: Image.asset(AppImage.icCloseDialog, width: 24.w, height: 24.w)),
              SizedBox(width: 24.w)
            ],
          ),
          content,
          shouldShowPrimaryButton
              ? ColorButton(
                title: primaryButtonTitle!,
                shouldEnable: true,
                onTap: () => primaryButtonCallback?.call()).paddingSymmetric(horizontal: 16.w)
              : const SizedBox(),
          shouldShowSecondaryButton
              ? ColorButton(
                title: secondaryButtonTitle!,
                onTap: () => secondaryButtonCallback?.call()).paddingOnly(top: 8.h, left: 16.w, right: 16.w)
              : const SizedBox(),
          SizedBox(height: 24.h)
        ],
      )
    );
  }

  bool get shouldShowPrimaryButton => primaryButtonTitle != null && primaryButtonTitle != '';

  bool get shouldShowSecondaryButton => secondaryButtonTitle != null && secondaryButtonTitle != '';
}
