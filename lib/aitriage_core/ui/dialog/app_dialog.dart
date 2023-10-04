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
  final double? dialogWidth;
  final double? dialogHeight;

  const AppDialog(
      {super.key,
      required this.content,
      required this.title,
      this.primaryButtonCallback,
      this.secondaryButtonCallback,
      this.primaryButtonTitle,
      this.secondaryButtonTitle,
      this.dialogHeight,
      this.dialogWidth});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        elevation: 0,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: SizedBox(
          width: dialogWidth ?? 400.w,
          height: dialogHeight ?? 320.h,
          child: Column(
            children: [
              SizedBox(height: 24.h),
              Row(
                children: [
                  SizedBox(width: 24.w),
                  Expanded(
                      child: Text(title, style: AppStyle.styleTextDialogTitle)),
                  GestureDetector(
                      onTap: () => Get.back(),
                      child: Image.asset(AppImage.icCloseDialog,
                          width: 24.w, height: 24.w)),
                  SizedBox(width: 24.w)
                ],
              ),
              content,
              shouldShowPrimaryButton && shouldShowSecondaryButton
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: SizedBox(
                        height: 48.h,
                        child: Row(children: [
                          shouldShowSecondaryButton
                              ? Expanded(
                                  child: ColorButton(
                                      height: 48.h,
                                      title: secondaryButtonTitle!,
                                      onTap: () =>
                                          secondaryButtonCallback?.call()),
                                )
                              : const SizedBox(),
                          (shouldShowPrimaryButton && shouldShowSecondaryButton)
                              ? SizedBox(width: 20.w)
                              : const SizedBox(),
                          shouldShowPrimaryButton
                              ? Expanded(
                                  child: ColorButton(
                                      height: 48.h,
                                      title: primaryButtonTitle!,
                                      shouldEnableBackground: true,
                                      onTap: () =>
                                          primaryButtonCallback?.call()),
                                )
                              : const SizedBox(),
                        ]),
                      ),
                    )
                  : const SizedBox(),
              SizedBox(height: 24.h)
            ],
          ),
        ));
  }

  bool get shouldShowPrimaryButton =>
      primaryButtonTitle != null && primaryButtonTitle != '';

  bool get shouldShowSecondaryButton =>
      secondaryButtonTitle != null && secondaryButtonTitle != '';
}
