import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/app_color.dart';

const _mrnRatio = 2;
const _createdAtRatio = 2;
const _genderRatio = 1;
const _raceRatio = 2;
const _ageRatio = 1;

class PatientSummaryListView extends StatelessWidget {
  const PatientSummaryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _Label(),
        _LineSeparated(margin: 8.h),
        Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) => const _PatientSummaryItem(),
              separatorBuilder: (BuildContext context, int index) => const _LineSeparated(),
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
            flex: _mrnRatio,
            child: Text('MRN', style: AppStyle.styleTextAllPatientCategory)),
        Expanded(
            flex: _createdAtRatio,
            child: Text('CREATED AT', style: AppStyle.styleTextAllPatientCategory)),
        Expanded(
            flex: _genderRatio,
            child: Text('GENDER', style: AppStyle.styleTextAllPatientCategory)),
        Expanded(
            flex: _raceRatio,
            child: Text('RACE', style: AppStyle.styleTextAllPatientCategory)),
        Expanded(
            flex: _ageRatio,
            child: Text('AGE', style: AppStyle.styleTextAllPatientCategory))
      ],
    );
  }
}

class _PatientSummaryItem extends StatelessWidget {
  const _PatientSummaryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: _mrnRatio,
            child: Row(
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
                Expanded(
                    child: Text('PATIENT001', style: AppStyle.stylePatientItemLabel)
                )
              ],
            )),
        Expanded(
            flex: _createdAtRatio,
            child: Text('05 Oct 2021, 11:39 am', style: AppStyle.stylePatientItemLabel)),
        Expanded(
            flex: _genderRatio,
            child: Text('M', style: AppStyle.stylePatientItemLabel)),
        Expanded(
            flex: _raceRatio,
            child: Text('African American', style: AppStyle.stylePatientItemLabel)),
        Expanded(
            flex: _ageRatio,
            child: Text('38y1m', style: AppStyle.stylePatientItemLabel))
      ],
    );
  }
}

class _LineSeparated extends StatelessWidget {
  final double? margin;
  const _LineSeparated({super.key, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: margin ?? 12.h),
      width: double.infinity,
      height: 1.h,
      color: AppColor.colorLineSeparated,
    );
  }
}


