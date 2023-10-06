import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:number_paginator/number_paginator.dart';
import '../../aitriage_core/common/app_color.dart';
import '../../aitriage_core/common/app_image.dart';
import '../../aitriage_core/common/app_style.dart';
import '../../aitriage_core/ui/widget/line_separated.dart';
import '../../aitriage_core/ui/widget/svg_icon_widget.dart';

const _orderColumnRatio = 2;
final _orderBlankWidth = 20.w;
const _noteColumnRatio = 20;
final _noteBlankWidth = 80.w;
const _creatorColumnRatio = 10;
const _dateTimeColumnRatio = 10;
final _blankWidth = 48.w;

class PatientDetailNote extends StatefulWidget {
  final String pageCountString;
  final int totalPage;
  final List<NoteVM> list;
  // id, note
  final Function(String, String)? onTapNote;
  final Function(int)? onPageChanged;

  const PatientDetailNote({
    super.key,
    required this.list,
    this.onTapNote,
    required this.pageCountString,
    required this.totalPage,
    this.onPageChanged
  });

  @override
  State<PatientDetailNote> createState() => _PatientDetailNoteState();
}

class _PatientDetailNoteState extends State<PatientDetailNote> {
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
              Text('Note', style: AppStyle.styleTextDialogTitle),
              const Spacer(),
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
                          onTap: () {
                            final id = widget.list[index].realId;
                            final note = widget.list[index].note;
                            widget.onTapNote?.call(id, note);
                          },
                          behavior: HitTestBehavior.translucent,
                          child: _NoteSummaryView(vm: widget.list[index])),
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
              flex: _noteColumnRatio,
              child:
              Text('NOTE', style: AppStyle.styleTextAllPatientCategory)),
          SizedBox(width: _noteBlankWidth),
          Expanded(
              flex: _creatorColumnRatio,
              child:
              Text('CREATOR', style: AppStyle.styleTextAllPatientCategory)),
          Expanded(
              flex: _dateTimeColumnRatio,
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('DATETIME', style: AppStyle.styleTextAllPatientCategory))),
          SizedBox(width: _blankWidth)
        ],
      ),
    );
  }
}

class _NoteSummaryView extends StatelessWidget {
  final NoteVM vm;

  const _NoteSummaryView({required this.vm});

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
            flex: _noteColumnRatio,
            child: Text(vm.note, style: AppStyle.stylePatientItemLabel, maxLines: 1, overflow: TextOverflow.ellipsis)),
        SizedBox(width: _noteBlankWidth),
        Expanded(
            flex: _creatorColumnRatio,
            child: Text(vm.creator, style: AppStyle.stylePatientItemLabel)),
        Expanded(
            flex: _dateTimeColumnRatio,
            child: Align(
                alignment: Alignment.topRight,
                child: Text(vm.dateTime, style: AppStyle.stylePatientItemLabel))),
        SizedBox(
          width: _blankWidth,
          child: Center(
              child: SvgIconWidget(name: AppImage.svgArrowRight, size: 20.h)),
        )
      ],
    );
  }
}


class NoteVM {
  final String id;
  final String note;
  final String creator;
  final String dateTime;
  final String realId;

  NoteVM(this.id, this.note, this.creator, this.dateTime, this.realId);
}