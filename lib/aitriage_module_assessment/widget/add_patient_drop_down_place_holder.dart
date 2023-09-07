import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../aitriage_core/common/app_color.dart';
import '../../aitriage_core/common/app_style.dart';

class AddPatientDropDownPlaceHolder extends StatelessWidget {
  final String title;
  final bool enableAsterisk;

  const AddPatientDropDownPlaceHolder({
    super.key,
    required this.title,
    this.enableAsterisk = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      padding: EdgeInsets.only(left: 16.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: AppStyle.styleTextButtonBackToLogin,),
          if (enableAsterisk) Text('*',
              style: AppStyle.styleTextButtonBackToLogin.copyWith(
                  color: AppColor.colorAsterisk))
        ],
      ),
    );
  }
}
