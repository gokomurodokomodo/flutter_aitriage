import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/patient_detail/patient_detail_vm.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../aitriage_core/common/app_color.dart';
import '../../aitriage_core/common/app_image.dart';
import '../../aitriage_core/common/app_style.dart';
import '../../aitriage_core/ui/widget/color_button.dart';
import '../../aitriage_core/ui/widget/custom_trailing_widget.dart';
import '../../aitriage_core/ui/widget/svg_icon_widget.dart';

class PatientDetailWidget extends StatelessWidget {
  final Function(int)? onTap;
  final Function? onTapPrimaryButton;
  final PatientDetailVM vm;

  const PatientDetailWidget({
    super.key,
    this.onTap,
    this.onTapPrimaryButton,
    required this.vm
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700.h,
      width: 325.w,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColor.colorAppBackground,
      ),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          SizedBox(
            width: 136.r,
            height: 136.r,
            child: Stack(
              children: [
                ClipOval(
                  child: SizedBox(
                    width: 136.r,
                    height: 136.r,
                    child: Image.network(
                        vm.patientAvatar,
                        errorBuilder: (_, __, ___) => Image.asset(vm.patientErrorAvatar)),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 5.r,
                  child: ClipOval(
                    child: Container(
                      width: 32.r,
                      height: 32.r,
                      color: AppColor.colorButtonBackgroundEnable,
                      child: Center(
                          child: SvgIconWidget(
                              name: AppImage.svgCamera,
                              size: 16.r)),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Text(vm.patientFullName, style: AppStyle.styleTextDialogTitle),
          SizedBox(height: 8.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(vm.patientRaceName, style: AppStyle.styleTextButtonBackToLogin),
              SizedBox(width: 8.w),
              Container(width: 1.w, height: 24.h, color: AppColor.colorInactiveFillColor),
              SizedBox(width: 8.w),
              Text(vm.patientAge, style: AppStyle.styleTextButtonBackToLogin)
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.h),
            width: double.infinity,
            height: 1.h,
            color: AppColor.colorInactiveFillColor,
          ),
          Expanded(child: _GroupButton(onTap: onTap, onTapPrimaryButton: onTapPrimaryButton))
        ],
      ),
    );
  }
}

class _GroupButton extends StatefulWidget {
  final Function(int)? onTap;
  final Function? onTapPrimaryButton;

  const _GroupButton({super.key, this.onTap, this.onTapPrimaryButton});

  @override
  State<_GroupButton> createState() => _GroupButtonState();
}

class _GroupButtonState extends State<_GroupButton> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => onTap(0),
          child: CustomTrailingWidget(
              height: 48.h,
              width: double.infinity,
              backgroundColor: selectedIndex == 0 ? AppColor.colorRailHover : AppColor.colorAppBackground,
              child: Row(
                  children: [
                    SizedBox(width: 12.w),
                    SvgIconWidget(name: AppImage.svgPatientDetailInformation),
                    SizedBox(width: 20.w),
                    Text('Information', style: selectedIndex == 0 ? AppStyle.styleRecordVitalSignsActive : AppStyle.styleRecordVitalSignsInactive)
                  ]
              )
          ),
        ),
        SizedBox(height: 16.h),
        GestureDetector(
          onTap: () => onTap(1),
          child: CustomTrailingWidget(
              height: 48.h,
              width: double.infinity,
              backgroundColor: selectedIndex == 1 ? AppColor.colorRailHover : AppColor.colorAppBackground,
              child: Row(
                  children: [
                    SizedBox(width: 12.w),
                    SvgIconWidget(name: AppImage.svgPatientDetailAssessment),
                    SizedBox(width: 20.w),
                    Text('Assessment', style: selectedIndex == 1 ? AppStyle.styleRecordVitalSignsActive : AppStyle.styleRecordVitalSignsInactive)
                  ]
              )
          ),
        ),
        SizedBox(height: 16.h),
        GestureDetector(
          onTap: () => onTap(2),
          child: CustomTrailingWidget(
              height: 48.h,
              width: double.infinity,
              backgroundColor: selectedIndex == 2 ? AppColor.colorRailHover : AppColor.colorAppBackground,
              child: Row(
                  children: [
                    SizedBox(width: 12.w),
                    SvgIconWidget(name: AppImage.svgPatientDetailNote),
                    SizedBox(width: 20.w),
                    Text('Note', style: selectedIndex == 2 ? AppStyle.styleRecordVitalSignsActive : AppStyle.styleRecordVitalSignsInactive)
                  ]
              )
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => widget.onTapPrimaryButton?.call(),
          child: CustomTrailingWidget(
              height: 48.h,
              width: double.infinity,
              backgroundColor: AppColor.colorBackgroundSearch,
              child: Center(child: Text('Delete', style: AppStyle.styleCancelAssessment))
          ),
        ),
      ],
    );
  }

  void onTap(int index) {
    widget.onTap?.call(index);
    setState(() => selectedIndex = index);
  }
}

