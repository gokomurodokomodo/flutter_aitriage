import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_color.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/entity/patient.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_aitriage/aitriage_core/util/date_time_parse_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../aitriage_module_patient/widget/gender_with_symbol.dart';
import 'line_separated.dart';

const _orderColumnRatio = 1;
const _patientColumnRatio = 10;
const _genderColumnRatio = 5;
const _raceColumnRatio = 10;
const _ageColumnRatio = 2;
const _lastAssessmentColumnRatio = 10;
final _blankWidth = 48.w;

class PatientSummaryListView extends StatefulWidget {
  final List<PatientSummaryVM> list;
  final Function(int)? onTapPatient;

  const PatientSummaryListView(
      {super.key, required this.list, this.onTapPatient});

  @override
  State<PatientSummaryListView> createState() => _PatientSummaryListViewState();
}

class _PatientSummaryListViewState extends State<PatientSummaryListView> {
  final scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (scrollController.hasClients) scrollController.jumpTo(0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _Label(),
        LineSeparated(margin: 8.h),
        Expanded(
            child: widget.list.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (BuildContext context, int index) =>
                        GestureDetector(
                            onTap: () => widget.onTapPatient?.call(widget.list[index].patientId),
                            behavior: HitTestBehavior.translucent,
                            child: _PatientSummaryItem(vm: widget.list[index])),
                    separatorBuilder: (BuildContext context, int index) =>
                        const LineSeparated(),
                    itemCount: widget.list.length,
                    controller: scrollController)
                : Center(
                    child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(AppImage.icListViewNoData),
                      SizedBox(height: 8.h),
                      Text('No data',
                          style: AppStyle.styleTextAllPatientCategory)
                    ],
                  )))
      ],
    );
  }
}

class _Label extends StatelessWidget {
  const _Label();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.colorSummaryViewLabel,
      height: 44.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: _orderColumnRatio,
              child: Text('#', style: AppStyle.styleTextAllPatientCategory)),
          Expanded(
              flex: _patientColumnRatio,
              child:
                  Text('PATIENT', style: AppStyle.styleTextAllPatientCategory)),
          Expanded(
              flex: _genderColumnRatio,
              child:
                  Text('GENDER', style: AppStyle.styleTextAllPatientCategory)),
          Expanded(
              flex: _raceColumnRatio,
              child: Text('CITY', style: AppStyle.styleTextAllPatientCategory)),
          Expanded(
              flex: _ageColumnRatio,
              child: Text(
                'AGE',
                style: AppStyle.styleTextAllPatientCategory,
                textAlign: TextAlign.right,
              )),
          Expanded(
              flex: _lastAssessmentColumnRatio,
              child: Text(
                'LAST ASSESSMENT DATE',
                style: AppStyle.styleTextAllPatientCategory,
                textAlign: TextAlign.right,
              )),
          SizedBox(width: _blankWidth)
        ],
      ),
    );
  }
}

class _PatientSummaryItem extends StatelessWidget {
  final PatientSummaryVM vm;

  const _PatientSummaryItem({required this.vm});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: _orderColumnRatio,
            child: Text(vm.id, style: AppStyle.stylePatientItemLabel)),
        Expanded(flex: _patientColumnRatio, child: _PatientCell(vm: vm)),
        Expanded(flex: _genderColumnRatio, child: _GenderCell(vm: vm)),
        Expanded(
            flex: _raceColumnRatio,
            child: Text(vm.city, style: AppStyle.stylePatientItemLabel)),
        Expanded(
            flex: _ageColumnRatio,
            child: Align(
                alignment: Alignment.topRight,
                child: Text(vm.age, style: AppStyle.stylePatientItemLabel))),
        Expanded(
            flex: _lastAssessmentColumnRatio,
            child: Align(
                alignment: Alignment.topRight,
                child: Text(vm.lastAssessmentDate,
                    style: AppStyle.stylePatientItemLabel))),
        SizedBox(
          width: _blankWidth,
          child: Center(
              child: SvgIconWidget(name: AppImage.svgArrowRight, size: 20.h)),
        )
      ],
    );
  }
}

class _PatientCell extends StatelessWidget {
  final PatientSummaryVM vm;

  const _PatientCell({required this.vm});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 40.r,
          width: 40.r,
          // decoration: const BoxDecoration(
          //   shape: BoxShape.circle,
          //   color: Colors.blue,
          // ),
          child: CircleAvatar(
            child: vm.avatar.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: vm.avatar,
                    errorWidget: (_, __, ___) => Image.asset(vm.defaultAvatar))
                : Image.asset(
                    vm.defaultAvatar,
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

  const _GenderCell({required this.vm});

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
  final String id;
  final Patient _patient;
  final String _genderColumnMediaUrl;
  final String _genderColumnValue;

  PatientSummaryVM(
      {required this.id,
      required Patient patient,
      required String genderColumnMediaUrl,
      required String genderColumnValue})
      : _patient = patient,
        _genderColumnMediaUrl = genderColumnMediaUrl,
        _genderColumnValue = genderColumnValue;

  String get avatar => _patient.avatar ?? '';

  String get defaultAvatar {
    if (_patient.gender == 'MALE') {
      return AppImage.icDefaultAvatarMale;
    } else if (_patient.gender == 'FEMALE') {
      return AppImage.icDefaultAvatarFemale;
    }

    return '';
  }

  String get genderImage => _genderColumnMediaUrl;

  String get genderText => _genderColumnValue;

  String get city => _patient.cityName ?? '';

  String get age => _patient.age?.toString() ?? '';

  String get lastAssessmentDate {
    if (_patient.lastActivityDate == null) {
      return '';
    } else {
      return DateTimeParserUtil().parseDateWithHour(_patient.lastActivityDate!);
    }
  }

  String get patientName => _patient.fullName ?? '';

  String get mrn => _patient.code ?? '';

  int get patientId => _patient.id ?? 0;
}
