import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../aitriage_core/common/app_color.dart';
import '../../aitriage_core/common/app_image.dart';
import '../../aitriage_core/common/app_style.dart';
import '../../aitriage_core/ui/widget/custom_trailing_widget.dart';
import '../../aitriage_core/ui/widget/group_button.dart';
import '../../aitriage_core/ui/widget/svg_icon_widget.dart';
import '../feature/patient_detail/patient_detail_vm.dart';

final _groupButtonVM = <GroupButtonVM>[
  GroupButtonVM(title: 'Information', image: AppImage.svgPatientDetailInformation),
  GroupButtonVM(title: 'Assessment', image: AppImage.svgPatientDetailAssessment),
  GroupButtonVM(title: 'Note', image: AppImage.svgPatientDetailNote),
];

class PatientDetailWidget extends StatelessWidget {
  final Function(int)? onTap;
  final Function? onTapPrimaryButton;
  final PatientDetailVM vm;
  final Function? onTapAvatar;

  const PatientDetailWidget({
    super.key,
    this.onTap,
    this.onTapPrimaryButton,
    this.onTapAvatar,
    required this.vm
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 720.h,
      width: 325.w,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColor.colorAppBackground,
      ),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: () => onTapAvatar?.call(),
            child: SizedBox(
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
          Expanded(
              child: GroupButton(children: _groupButtonVM, onTap: onTap)),
          const Spacer(),
          GestureDetector(
            onTap: () => onTapPrimaryButton,
            child: CustomTrailingWidget(
                height: 48.h,
                width: double.infinity,
                backgroundColor: AppColor.colorBackgroundSearch,
                child: Center(child: Text('Delete', style: AppStyle.styleCancelAssessment))
            ),
          ),
        ],
      ),
    );
  }
}