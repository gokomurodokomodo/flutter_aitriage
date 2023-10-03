import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/color_button.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_trailing_widget.dart';
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
  final Function(int)? onTapPatient;

  const PatientDetailAssessment({super.key, required this.list, this.onTapPatient});

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
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
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
              child: widget.list.isNotEmpty
                  ? ListView.separated(
                      itemBuilder: (BuildContext context, int index) =>
                          GestureDetector(
                              onTap: () => widget.onTapPatient?.call(0),
                              behavior: HitTestBehavior.translucent,
                              child: _AssessmentSummaryView(vm: widget.list[index])),
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
                    ))),
          LineSeparated(margin: 16.h),
          Row(
            children: [
              Text(
                'Show 1 - 10/40',
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
                  width: (50 * 5).toDouble().w + 20.w + 100.w,
                  child: StatefulBuilder(
                    builder: (_, setState) {
                      return NumberPaginator(
                        numberPages: 5,
                        onPageChange: (value) {},
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
                child: Text(vm._id, style: AppStyle.stylePatientItemLabel))),
        SizedBox(width: _orderBlankWidth),
        Expanded(
            flex: _dateTimeColumnRatio,
            child: Text(vm._dateTime, style: AppStyle.stylePatientItemLabel)),
        Expanded(
            flex: _doctorColumnRatio,
            child: Text(vm._doctor, style: AppStyle.stylePatientItemLabel)),
        Expanded(
            flex: _recordingTimeColumnRatio,
            child: Align(
                alignment: Alignment.topRight,
                child: Text(vm._recordingTime, style: AppStyle.stylePatientItemLabel))),
        Expanded(
            flex: _resultColumnRatio,
            child: Align(
                alignment: Alignment.topRight,
                child: CustomTrailingWidget(
                    backgroundColor: AppColor.colorRailHover,
                    width: 70.w,
                    height: 30.h,
                    borderRadiusValue: 8.r,
                    child: Text(vm._result, style: AppStyle.styleAssessmentSummaryText)))),
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
  final String _id = '0';
  final String _dateTime = '05 Oct 2021, 11:39 AM';
  final String _doctor = 'Alber Flores';
  final String _recordingTime = '17:06';
  final String _result = 'Low risk';
}
