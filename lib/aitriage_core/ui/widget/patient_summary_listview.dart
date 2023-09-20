import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../aitriage_module_assessment/domain/entity/patient_param.dart';
import '../../../aitriage_module_assessment/widget/gender_with_symbol.dart';
import 'line_separated.dart';

const _orderRatio = 1;
const _patientRatio = 10;
const _genderRatio = 5;
const _raceRatio = 10;
const _ageRatio = 2;
const _lastAssessmentRatio = 10;
final _blankWidth = 48.w;

class PatientSummaryListView extends StatelessWidget {
  final List<PatientSummaryVM> list;

  const PatientSummaryListView({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _Label(),
        LineSeparated(margin: 8.h),
        Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) => const _PatientSummaryItem(),
              separatorBuilder: (BuildContext context, int index) => const LineSeparated(),
              itemCount: 20,
        ))
      ],
    );
  }
}

class _Label extends StatelessWidget {
  const _Label();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: _orderRatio,
            child: Text('#', style: AppStyle.styleTextAllPatientCategory)),
        Expanded(
            flex: _patientRatio,
            child: Text('PATIENT', style: AppStyle.styleTextAllPatientCategory)),
        Expanded(
            flex: _genderRatio,
            child: Text('GENDER', style: AppStyle.styleTextAllPatientCategory)),
        Expanded(
            flex: _raceRatio,
            child: Text('RACE', style: AppStyle.styleTextAllPatientCategory)),
        Expanded(
            flex: _ageRatio,
            child: Align(
                alignment: Alignment.topRight,
                child: Text('AGE', style: AppStyle.styleTextAllPatientCategory))),
        Expanded(
            flex: _lastAssessmentRatio,
            child: Align(
                alignment: Alignment.topRight,
                child: Text('LAST ASSESSMENT DATE', style: AppStyle.styleTextAllPatientCategory))),
        SizedBox(width: _blankWidth)
      ],
    );
  }
}

class _PatientSummaryItem extends StatelessWidget {
  const _PatientSummaryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: _orderRatio,
            child: Text('1', style: AppStyle.stylePatientItemLabel)),
        const Expanded(
            flex: _patientRatio,
            child: _PatientCell()),
        const Expanded(
            flex: _genderRatio,
            child: _GenderCell()),
        Expanded(
            flex: _raceRatio,
            child: Text('African American', style: AppStyle.stylePatientItemLabel)),
        Expanded(
            flex: _ageRatio,
            child: Align(
                alignment: Alignment.topRight,
                child: Text('38', style: AppStyle.stylePatientItemLabel))),
        Expanded(
            flex: _lastAssessmentRatio,
            child: Align(
                alignment: Alignment.topRight,
                child: Text('05 Oct 2021, 11:39 am', style: AppStyle.stylePatientItemLabel))),
        SizedBox(
            width: _blankWidth,
            child: Center(child: SvgIconWidget(name: AppImage.svgArrowRight, size: 20.h)),
        )
      ],
    );
  }
}

class _PatientCell extends StatelessWidget {
  const _PatientCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 32.r,
          width: 32.r,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
        ),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('PATIENT001', style: AppStyle.styleTextDropDownButton),
            Text('MRN001', style: AppStyle.styleAssessmentItemLabel)
          ],
        )
      ],
    );
  }
}

class _GenderCell extends StatelessWidget {
  const _GenderCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GenderWithSymbol(
          gender: Gender.male,
          backgroundSize: 32.h,
          iconSize: 24.h,
        ),
        SizedBox(width: 8.w),
        Text('Male', style: AppStyle.stylePatientItemLabel)
      ],
    );
  }
}

class PatientSummaryVM {
  Patient? patient;
  var avatar = '';
  var gender = '';
}

