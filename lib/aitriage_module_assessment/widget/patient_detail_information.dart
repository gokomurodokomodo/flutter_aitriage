import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
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
          _RowItem(leftText: 'MRN', rightText: vm.patientCode),
          _RowItem(leftText: 'Patient name', rightText: vm.patientFullName),
          _RowItem(leftText: 'Date of birth', rightText: vm.patientYearOfBirth),
          _RowItem(leftText: 'Gender', rightText: vm.patientGender),
          _RowItem(leftText: 'Race', rightText: vm.patientRaceName),
          _RowItem(leftText: 'Phone number', rightText: vm.patientPhoneCode, shouldColoredRightText: true),
          _RowItem(leftText: 'Email', rightText: vm.patientEmail, shouldColoredRightText: true),
          _RowItem(leftText: 'Nationality', rightText: vm.patientNationalityName),
          _RowItem(leftText: 'State', rightText: vm.patientStateName),
          _RowItem(leftText: 'City', rightText: vm.patientCityName),
          _RowItem(leftText: 'Address', rightText: vm.patientAddress),
          _RowItem(leftText: 'Description', rightText: vm.patientDescription),
        ],
      ),
    );
  }
}

class _RowItem extends StatelessWidget {
  final String leftText;
  final String rightText;
  final String? svg;
  final bool shouldColoredRightText;

  const _RowItem({
    super.key,
    this.svg,
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
        if (svg != null) SvgIconWidget(name: svg!, size: 20.r).marginOnly(right: 12.w),
        Text(
            rightText,
            style: shouldColoredRightText
                ? AppStyle.styleTextPatientInformation2
                : AppStyle.styleTextPatientInformation),
      ],
    );
  }
}

