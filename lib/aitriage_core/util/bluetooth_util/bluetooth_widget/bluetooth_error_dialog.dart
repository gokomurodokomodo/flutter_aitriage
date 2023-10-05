import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/dialog/app_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/app_color.dart';

class BluetoothErrorDialog extends StatelessWidget{
  final String title;
  final String content;
  final String primaryTitle;
  final String secondaryTitle;
  final Function()? primaryAction;
  final Function()? secondaryAction;

  const BluetoothErrorDialog(
      {super.key,
      required this.title,
      required this.content,
      required this.primaryTitle,
      required this.secondaryTitle,
      this.primaryAction,
      this.secondaryAction});

  @override
  Widget build(BuildContext context) {
    return AppDialog(
        primaryButtonTitle: primaryTitle,
        secondaryButtonTitle: secondaryTitle,
        primaryButtonCallback: primaryAction,
        secondaryButtonCallback: secondaryAction,
        content: Column(
          children: [
            SizedBox(height: 24.h,),
            const Divider(
              color: AppColor.colorInactiveFillColor,
            ),
            SizedBox(height: 24.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                content,
                style: AppStyle.styleCheckYourEmail,
                textAlign: TextAlign.center,),
            ),
            SizedBox(height: 24.h,),
            const Divider(
              color: AppColor.colorInactiveFillColor,
            ),
            SizedBox(height: 24.h,),
          ],
        ),
        title: title);
  }

}