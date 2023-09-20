import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/entity/patient.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              itemBuilder: (BuildContext context, int index) => _PatientSummaryItem(vm: list[index]),
              separatorBuilder: (BuildContext context, int index) => const LineSeparated(),
              itemCount: list.length,
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
  final PatientSummaryVM vm;

  const _PatientSummaryItem({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: _orderRatio,
            child: Text('1', style: AppStyle.stylePatientItemLabel)),
        Expanded(
            flex: _patientRatio,
            child: _PatientCell(vm: vm)),
        Expanded(
            flex: _genderRatio,
            child: _GenderCell(vm: vm)),
        Expanded(
            flex: _raceRatio,
            child: Text(vm.race, style: AppStyle.stylePatientItemLabel)),
        Expanded(
            flex: _ageRatio,
            child: Align(
                alignment: Alignment.topRight,
                child: Text(vm.age, style: AppStyle.stylePatientItemLabel))),
        Expanded(
            flex: _lastAssessmentRatio,
            child: Align(
                alignment: Alignment.topRight,
                child: Text(vm.lastAssessmentDate, style: AppStyle.stylePatientItemLabel))),
        SizedBox(
            width: _blankWidth,
            child: Center(child: SvgIconWidget(name: AppImage.svgArrowRight, size: 20.h)),
        )
      ],
    );
  }
}

class _PatientCell extends StatelessWidget {
  final PatientSummaryVM vm;

  const _PatientCell({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 32.r,
          width: 32.r,
          // decoration: const BoxDecoration(
          //   shape: BoxShape.circle,
          //   color: Colors.blue,
          // ),
          child: CircleAvatar(
            child: CachedNetworkImage(
              imageUrl: vm.avatar,
              errorWidget: (_, __, ___) => const SizedBox()
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(vm.patientName, style: AppStyle.styleTextDropDownButton),
            Text(vm.mrn, style: AppStyle.styleAssessmentItemLabel)
          ],
        )
      ],
    );
  }
}

class _GenderCell extends StatelessWidget {
  final PatientSummaryVM vm;

  const _GenderCell({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
            imageUrl: vm.genderImage,
            errorWidget: (_, __, ___) => GenderWithSymbol(
                  gender: Gender.male,
                  backgroundSize: 32.h,
                  iconSize: 24.h,
                )),
        SizedBox(width: 8.w),
        Text(vm.genderText, style: AppStyle.stylePatientItemLabel)
      ],
    );
  }
}

class PatientSummaryVM {
  final Patient _patient;
  final String _genderColumnMediaUrl;
  final String _genderColumnValue;

  PatientSummaryVM({
    required Patient patient,
    required String genderColumnMediaUrl,
    required String genderColumnValue
  })  : _patient = patient,
        _genderColumnMediaUrl = genderColumnMediaUrl,
        _genderColumnValue = genderColumnValue;

  String get avatar {
    if (_patient.avatar != null) {
      return _patient.avatar!;
    } else if (_patient.gender == 'MALE') {
      return '';
    } else if (_patient.gender == 'FEMALE') {
      return '';
    }

    return '';
  }

  String get genderImage => _genderColumnMediaUrl;

  String get genderText => _genderColumnValue;

  String get race => _patient.raceName ?? '';

  String get age => _patient.age?.toString() ?? '';

  String get lastAssessmentDate => _patient.lastActivityDate ?? '';

  String get patientName => _patient.fullName ?? '';

  String get mrn => _patient.code ?? '';
}

