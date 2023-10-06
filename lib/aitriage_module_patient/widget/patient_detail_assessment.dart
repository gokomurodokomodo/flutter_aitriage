import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/entity/assessment.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/base_list_view.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/color_button.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_trailing_widget.dart';
import 'package:flutter_aitriage/aitriage_core/util/date_time_parse_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:number_paginator/number_paginator.dart';
import '../../aitriage_core/common/app_color.dart';
import '../../aitriage_core/common/app_image.dart';
import '../../aitriage_core/ui/widget/line_separated.dart';
import '../../aitriage_core/ui/widget/svg_icon_widget.dart';

const _orderColumnRatio = 2;
final _orderBlankWidth = 20.w;
const _dateTimeColumnRatio = 10;
const _doctorColumnRatio = 10;
const _recordingTimeColumnRatio = 6;
const _resultColumnRatio = 10;
final _blankWidth = 48.w;

class PatientDetailAssessment extends StatefulWidget {
  final List<AssessmentVM> list;
  final Function(int)? onTapAssessment;
  final String pageCountString;
  final int totalPage;
  final Function(int)? onPageChanged;

  const PatientDetailAssessment({
    super.key,
    required this.list,
    this.onTapAssessment,
    required this.pageCountString,
    required this.totalPage,
    this.onPageChanged
  });

  @override
  State<PatientDetailAssessment> createState() => _PatientDetailAssessmentState();
}

class _PatientDetailAssessmentState extends State<PatientDetailAssessment> {
  final scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (scrollController.hasClients) scrollController.jumpTo(0);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        children: [
          Row(
            children: [
              Text('Assessment', style: AppStyle.styleTextDialogTitle),
              const Spacer(),
              ColorButton(
                  title: 'Export PDF',
                  shouldEnableBackground: false,
                  shouldTapAbleWhenDisable: true,
                  textStyle: AppStyle.styleRememberMeText,
                  width: 104.w,
                  height: 40.h,
              )
            ],
          ),
          SizedBox(height: 20.h),
          const _Label(),
          SizedBox(height: 16.h),
          Expanded(
              child: BaseListView(
                onTapItem: (index) {
                  final realId = widget.list[index]._assessment.id;
                  widget.onTapAssessment?.call(realId ?? 0);
                },
                children: widget.list.map((vm) => _AssessmentSummaryView(vm: vm)).toList())),
          LineSeparated(margin: 16.h),
          Row(
            children: [
              Text(
                widget.pageCountString,
                style: AppStyle.styleRememberMeText,
              ),
              const Spacer(),
              Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  height: 50.w,
                  ///Tính chiều rộng động. 20 là tổng padding giữa 2 dấu mũi tên.
                  ///100 là tổng khoảng cách của 2 ô mũi tên, do trong thư viện set height = width
                  ///nên set cứng height là 50.w để lấy khoảng cách.
                  ///50 * totalPage để tính độ rộng cần thiết cho content ở giữa.
                  width: (50 * widget.totalPage).toDouble().w + 20.w + 100.w,
                  child: StatefulBuilder(
                    builder: (_, setState) {
                      return NumberPaginator(
                        numberPages: widget.totalPage,
                        onPageChange: (value) {
                          widget.onPageChanged?.call(value);
                        },
                        config: NumberPaginatorUIConfig(
                            contentPadding:
                            const EdgeInsets.all(0),
                            buttonShape:
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(
                                  8.r),
                            )),
                      );
                    },
                  ),
                ),
              )
            ],
          )
        ],
      ),
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
              child: Align(
                  alignment: Alignment.center,
                  child: Text('#', style: AppStyle.styleTextAllPatientCategory))),
          SizedBox(width: _orderBlankWidth),
          Expanded(
              flex: _dateTimeColumnRatio,
              child:
              Text('DATETIME', style: AppStyle.styleTextAllPatientCategory)),
          Expanded(
              flex: _doctorColumnRatio,
              child:
              Text('DOCTOR', style: AppStyle.styleTextAllPatientCategory)),
          Expanded(
              flex: _recordingTimeColumnRatio,
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('RECORDING TIME', style: AppStyle.styleTextAllPatientCategory))),
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

class _AssessmentSummaryView extends StatelessWidget {
  final AssessmentVM vm;

  const _AssessmentSummaryView({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: _orderColumnRatio,
            child: Align(
                alignment: Alignment.center,
                child: Text(vm.id, style: AppStyle.stylePatientItemLabel))),
        SizedBox(width: _orderBlankWidth),
        Expanded(
            flex: _dateTimeColumnRatio,
            child: Text(vm.dateTime, style: AppStyle.stylePatientItemLabel)),
        Expanded(
            flex: _doctorColumnRatio,
            child: Text(vm.doctor, style: AppStyle.stylePatientItemLabel)),
        Expanded(
            flex: _recordingTimeColumnRatio,
            child: Align(
                alignment: Alignment.topRight,
                child: Text(vm.recordingTime, style: AppStyle.stylePatientItemLabel))),
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


class AssessmentVM {
  final Assessment _assessment;
  final String id;

  String get dateTime {
    return DateTimeParserUtil().parseDateWithHour(_assessment.assessmentDate ?? '');
  }

  String get doctor => _assessment.doctorName ?? '';

  String get recordingTime {
    final seconds = _assessment.assessmentDuration ?? 0;
    final minutes = seconds ~/ 60;
    final secondsRemaining = seconds % 60;
    return '$minutes:${ (secondsRemaining < 10) ? '0' : ''}$secondsRemaining';
  }

  String get result {
    return switch (_assessment.riskScoreCategory) {
      'LOW' => 'Low risk',
      'MEDIUM' => 'Medium risk',
      'HIGH' => 'High risk',
      _ => ''
    };
  }

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

  AssessmentVM(this._assessment, this.id);
}
