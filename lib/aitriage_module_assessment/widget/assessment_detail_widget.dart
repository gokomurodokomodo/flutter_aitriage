import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../aitriage_core/common/app_color.dart';
import '../../aitriage_core/common/app_image.dart';
import '../../aitriage_core/common/app_style.dart';
import '../../aitriage_core/ui/widget/color_button.dart';
import '../../aitriage_core/ui/widget/custom_trailing_widget.dart';
import '../../aitriage_core/ui/widget/group_button.dart';
import '../../aitriage_core/ui/widget/svg_icon_widget.dart';

final _groupButtonVM = <GroupButtonVM>[
  GroupButtonVM(title: 'Record vital signs', image: AppImage.svgRecordVitalSigns),
  GroupButtonVM(title: 'HEAR Score', image: AppImage.svgHearScore),
  GroupButtonVM(title: 'Assessment Results', image: AppImage.svgAssessmentResult),
];

class AssessmentDetailWidget extends StatefulWidget {
  final Function(int)? onTap;
  final Function? onTapPrimaryButton;

  const AssessmentDetailWidget({super.key, this.onTap, this.onTapPrimaryButton});

  @override
  State<AssessmentDetailWidget> createState() => _AssessmentDetailWidgetState();
}

class _AssessmentDetailWidgetState extends State<AssessmentDetailWidget> {
  var selectedIndex = 0;

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
          SizedBox(
            width: 136.r,
            height: 136.r,
            child: ClipOval(
              child: SizedBox(
                width: 136.r,
                height: 136.r,
                child: Image.network(
                    'https://almcharities.com/wp-content/uploads/2019/05/placeholder-circle-300x300.png',
                    errorBuilder: (_, __, ___) => Image.asset('vm.patientErrorAvatar')),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text('vm.patientFullName', style: AppStyle.styleTextDialogTitle),
          SizedBox(height: 8.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('vm.patientRaceName', style: AppStyle.styleTextButtonBackToLogin),
              SizedBox(width: 8.w),
              Container(width: 1.w, height: 24.h, color: AppColor.colorInactiveFillColor),
              SizedBox(width: 8.w),
              Text('vm.patientAge', style: AppStyle.styleTextButtonBackToLogin)
            ],
          ),
          SizedBox(height: 8.h),
          ColorButton(
              title: 'Add note',
              shouldEnableBackground: true,
              width: 130.w,
              leftIcon: SvgIconWidget(
                  name: AppImage.svgPlus,
                  size: 20.r,
                  color: AppColor.colorAppBackground).marginOnly(right: 10.w)),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.h),
            width: double.infinity,
            height: 1.h,
            color: AppColor.colorInactiveFillColor,
          ),
          GroupButton(children: _groupButtonVM),
          const Spacer(),
          GestureDetector(
            onTap: () => widget.onTapPrimaryButton?.call(),
            child: CustomTrailingWidget(
                height: 48.h,
                width: double.infinity,
                backgroundColor: AppColor.colorBackgroundSearch,
                child: Center(child: Text('Cancel Assessment', style: AppStyle.styleCancelAssessment))
            ),
          ),
        ],
      ),
    );
  }

  void onTap(int index) {
    widget.onTap?.call(index);
    setState(() => selectedIndex = index);
  }
}
