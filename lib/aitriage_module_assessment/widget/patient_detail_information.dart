import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/line_separated.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/patient_detail/patient_detail_vm.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PatientDetailInformation extends StatelessWidget {
  final PatientDetailVM vm;

  const PatientDetailInformation({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          _RowItem(leftText: 'MRN', rightText: vm.patientCode),
          LineSeparated(margin: 24.h),
          _RowItem(leftText: 'Patient name', rightText: vm.patientFullName),
          LineSeparated(margin: 24.h),
          _RowItem(leftText: 'Date of birth', rightText: vm.patientYearOfBirth),
          LineSeparated(margin: 24.h),
          _RowItem(leftText: 'Gender', rightText: vm.patientGender, imageUrl: vm.patientGenderImageUrl),
          LineSeparated(margin: 24.h),
          _RowItem(leftText: 'Race', rightText: vm.patientRaceName),
          LineSeparated(margin: 24.h),
          _RowItem(leftText: 'Phone number', rightText: vm.patientPhoneNumber, shouldColoredRightText: true),
          LineSeparated(margin: 24.h),
          _RowItem(leftText: 'Email', rightText: vm.patientEmail, shouldColoredRightText: true),
          LineSeparated(margin: 24.h),
          _RowItem(leftText: 'Nationality', rightText: vm.patientNationalityName),
          LineSeparated(margin: 24.h),
          _RowItem(leftText: 'State', rightText: vm.patientStateName),
          LineSeparated(margin: 24.h),
          _RowItem(leftText: 'City', rightText: vm.patientCityName),
          LineSeparated(margin: 24.h),
          _RowItem(leftText: 'Address', rightText: vm.patientAddress),
          LineSeparated(margin: 24.h),
          _RowItem(leftText: 'Description', rightText: vm.patientDescription),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

class _RowItem extends StatelessWidget {
  final String leftText;
  final String rightText;
  final String? imageUrl;
  final bool shouldColoredRightText;

  const _RowItem({
    super.key,
    this.imageUrl,
    this.shouldColoredRightText = false,
    required this.leftText,
    required this.rightText
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(leftText, style: AppStyle.styleTextPatientInformation),
        const Spacer(),
        if (imageUrl != null) CachedNetworkImage(
              imageUrl: imageUrl!,
              width: 20.r,
              height: 20.r,
              errorWidget: (_, __, ___) => const SizedBox()).marginOnly(right: 12.w),
        Text(
            rightText,
            style: shouldColoredRightText
                ? AppStyle.styleTextPatientInformation2
                : AppStyle.styleTextPatientInformation),
      ],
    );
  }
}

