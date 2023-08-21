import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../aitriage_core/common/app_color.dart';
import '../../aitriage_core/common/app_style.dart';

class DashboardPatientViewer extends StatelessWidget {
  final String? label;
  final int? amount;
  final double? percent;
  final bool isGrowing;

  const DashboardPatientViewer({
    super.key,
    this.label,
    this.amount,
    this.percent,
    this.isGrowing = true
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.colorAppBackground,
      width: 300.w,
      height: 150.h,
      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                color: Colors.black,
                child: const Icon(Icons.abc)),
            SizedBox(height: 8.h),
            Text(label ?? '', style: AppStyle.styleDashboardPatientViewer,),
            SizedBox(height: 8.h),
            Expanded(
                child: Row(
                  children: [
                    (amount != null) ? Expanded(child: Text(amount.toString(), style: AppStyle.styleTextDashboardTitle,)) : const SizedBox(),
                    const Spacer(),
                    (percent == null) ? const SizedBox() : Container(
                      decoration: BoxDecoration(
                        color: isGrowing ? Colors.green : Colors.redAccent,
                      ),
                      child: Text('${isGrowing ? '+' : '-'}$percent${isGrowing ? '⬈' : '⬊'}'),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}