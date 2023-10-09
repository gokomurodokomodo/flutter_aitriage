import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/base_list_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../aitriage_core/common/app_color.dart';
import '../../aitriage_core/common/app_image.dart';
import '../../aitriage_core/common/app_style.dart';
import '../../aitriage_core/entity/assessment.dart';
import '../../aitriage_core/ui/widget/custom_trailing_widget.dart';
import '../../aitriage_core/ui/widget/line_separated.dart';
import '../../aitriage_core/ui/widget/svg_icon_widget.dart';
import '../../aitriage_core/util/date_time_parse_util.dart';
import '../../aitriage_module_patient/widget/gender_with_symbol.dart';

const _orderColumnRatio = 1;
const _mrnColumnRatio = 10;
const _genderColumnRatio = 5;
const _cityColumnRatio = 10;
const _ageColumnRatio = 2;
const _dateTimeColumnRatio = 10;
const _resultColumnRatio = 5;
final _blankWidth = 48.w;

class AssessmentSummaryListView extends StatelessWidget {
  final List<AssessmentSummaryVM> list;
  final Function(int)? onTapAssessment;

  const AssessmentSummaryListView({super.key, required this.list, this.onTapAssessment});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _Label(),
        LineSeparated(margin: 8.h),
        Expanded(
            child: BaseListView(
              onTapItem: (index) => onTapAssessment?.call(list[index].realId),
              children: list.map((e) => _AssessmentSummaryItem(vm: e)).toList(),
            ))
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
              flex: _mrnColumnRatio,
              child:
              Text('MRN', style: AppStyle.styleTextAllPatientCategory)),
          Expanded(
              flex: _genderColumnRatio,
              child:
              Text('GENDER', style: AppStyle.styleTextAllPatientCategory)),
          Expanded(
              flex: _cityColumnRatio,
              child: Text('CITY', style: AppStyle.styleTextAllPatientCategory)),
          Expanded(
              flex: _ageColumnRatio,
              child: Text(
                'AGE',
                style: AppStyle.styleTextAllPatientCategory,
                textAlign: TextAlign.right,
              )),
          Expanded(
              flex: _dateTimeColumnRatio,
              child: Text(
                'DATETIME',
                style: AppStyle.styleTextAllPatientCategory,
                textAlign: TextAlign.right,
              )),
          Expanded(
              flex: _resultColumnRatio,
              child: Text(
                'RESULT',
                style: AppStyle.styleTextAllPatientCategory,
                textAlign: TextAlign.right,
              )),
          SizedBox(width: _blankWidth)
        ],
      ),
    );
  }
}

class _AssessmentSummaryItem extends StatelessWidget {
  final AssessmentSummaryVM vm;

  const _AssessmentSummaryItem({super.key, required this.vm
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: _orderColumnRatio,
            child: Text(vm.id, style: AppStyle.stylePatientItemLabel)),
        Expanded(
            flex: _mrnColumnRatio,
            child: _PatientCell(vm: vm)),
        Expanded(
            flex: _genderColumnRatio,
            child: _GenderCell(vm: vm)),
        Expanded(
            flex: _cityColumnRatio,
            child: Text(vm.city, style: AppStyle.stylePatientItemLabel)),
        Expanded(
            flex: _ageColumnRatio,
            child: Text(
              vm.age,
              style: AppStyle.stylePatientItemLabel,
              textAlign: TextAlign.right,
            )),
        Expanded(
            flex: _dateTimeColumnRatio,
            child: Text(
              vm.dateTime,
              style: AppStyle.stylePatientItemLabel,
              textAlign: TextAlign.right,
            )),
        Expanded(
            flex: _resultColumnRatio,
            child: Align(
                alignment: Alignment.topRight,
                child: CustomTrailingWidget(
                    backgroundColor: vm.resultBackgroundColor,
                    width: 100.w,
                    height: 30.h,
                    borderRadiusValue: 8.r,
                    child: Text(vm.result, style: vm.resultTextStyle, textAlign: TextAlign.center)))),
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
  final AssessmentSummaryVM vm;

  const _PatientCell({required this.vm});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 40.r,
          width: 40.r,
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
            Text(vm.fullName, style: AppStyle.styleTextDropDownButton),
            Text(vm.customerCode, style: AppStyle.styleAssessmentItemLabel)
          ],
        )
      ],
    );
  }
}

class _GenderCell extends StatelessWidget {
  final AssessmentSummaryVM vm;

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

class AssessmentSummaryVM {
  final String id;
  final Assessment _assessment;
  final String _genderColumnMediaUrl;
  final String _genderColumnValue;

  AssessmentSummaryVM(
      this.id,
      this._assessment,
      this._genderColumnMediaUrl,
      this._genderColumnValue
  );

  String get avatar => _assessment.avatar ?? '';

  String get fullName => _assessment.fullName ?? '';

  String get customerCode => _assessment.customerCode ?? '';

  String get defaultAvatar {
    if (_assessment.gender == 'MALE') {
      return AppImage.icDefaultAvatarMale;
    } else if (_assessment.gender == 'FEMALE') {
      return AppImage.icDefaultAvatarFemale;
    }

    return '';
  }

  String get genderImage => _genderColumnMediaUrl;

  String get genderText => _genderColumnValue;

  String get city => _assessment.cityName ?? '';

  String get age => _assessment.yearOld?.toString() ?? '';

  String get dateTime {
    if (_assessment.assessmentDate == null) {
      return '';
    } else {
      return DateTimeParserUtil().parseDateWithHour(_assessment.assessmentDate!);
    }
  }

  String get result {
    return switch (_assessment.riskScoreCategory) {
      'LOW' => 'Low risk',
      'MEDIUM' => 'Medium risk',
      'HIGH' => 'High risk',
      _ => ''
    };
  }

  int get realId => _assessment.id ?? 0;

  TextStyle get resultTextStyle {
    return switch (_assessment.riskScoreCategory) {
      'LOW' => AppStyle.styleAssessmentSummaryText,
      'MEDIUM' => AppStyle.styleTextMediumRisk,
      'HIGH' => AppStyle.styleTextHighRisk,
      _ => AppStyle.styleAssessmentSummaryText
    };
  }

  Color get resultBackgroundColor {
    return switch (_assessment.riskScoreCategory) {
      'LOW' => AppColor.colorRailHover,
      'MEDIUM' => AppColor.colorUserProfileBackground,
      'HIGH' => AppColor.colorHighRiskBackground,
      _ => AppColor.colorRailHover
    };
  }
}
