import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_color.dart';

class AppStyle {
  AppStyle._();
  // Font size
  static double fontSizeMin = 10.0.sp;
  static double fontSizeName = 22.0.sp;
  static double fontSizeXS = 12.0.sp;
  static double fontSizeSM = 14.0.sp;
  static double fontSizeBase = 16.0.sp;
  static double fontSizeL = 18.0.sp;
  static double fontSizeXL = 20.0.sp;
  static double fontSize2XL = 24.0.sp;
  static double fontSize3XL = 30.0.sp;
  static double fontSize32XL = 32.0.sp;
  static double fontSize4XL = 36.0.sp;
  static double fontSize5XL = 48.0.sp;
  // Font weight
  static const FontWeight fontWeightSemiBold = FontWeight.w600;
  static const FontWeight fontWeight500 = FontWeight.w500;
  static const FontWeight fontWeightRegular = FontWeight.w400;
  // Text style
  static TextStyle styleTextColorButtonEnable = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightRegular,
    color: AppColor.colorButtonTextEnable,
  );
  static TextStyle styleTextColorButtonDisable = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightRegular,
    color: AppColor.colorButtonTextDisable,
  );
  static TextStyle styleTextDialogTitle = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightSemiBold,
    color: AppColor.colorDialogTitleText,
  );
  static TextStyle styleTextDashboardTitle = TextStyle(
    fontSize: fontSize2XL,
    fontWeight: fontWeightSemiBold,
    color: AppColor.colorDialogTitleText,
  );
  static TextStyle styleTextAlertHeader = TextStyle(
    fontSize: fontSizeXL,
    fontWeight: fontWeightSemiBold,
    color: AppColor.colorAlertHeader,
  );
  static TextStyle styleTextColorGetStarted = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightRegular,
    color: AppColor.colorTextGettingStarted,
  );
  static TextStyle styleDashboardPatientViewer = TextStyle(
    fontSize: fontSizeSM,
    fontWeight: fontWeightRegular,
    color: AppColor.colorCloseButton,
  );
  static TextStyle styleLoginHeader = TextStyle(
    fontSize: fontSize32XL,
    fontWeight: fontWeightSemiBold,
    color: AppColor.colorDialogTitleText,
  );
  static TextStyle styleCustomTextFieldLabel = TextStyle(
    fontSize: fontSizeSM,
    fontWeight: fontWeight500,
    color: AppColor.colorAlertHeader,
  );
  static TextStyle styleCustomTextFieldHintText = TextStyle(
    fontSize: fontSizeSM,
    fontWeight: fontWeightRegular,
    color: AppColor.colorTextFieldPlaceHoler,
  );
  static TextStyle styleRememberMeText = TextStyle(
    fontSize: fontSizeSM,
    fontWeight: fontWeightRegular,
    color: AppColor.colorRememberMeText,
  );
  static TextStyle styleCheckYourEmailNotification = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightRegular,
    color: AppColor.colorRememberMeText,
  );
  static TextStyle styleTextButtonBackToLogin = TextStyle(
    fontSize: fontSizeSM,
    fontWeight: fontWeight500,
    color: AppColor.colorRememberMeText,
  );
  static TextStyle styleCheckYourEmail = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightSemiBold,
    color: AppColor.colorRememberMeText,
  );
  static TextStyle styleTextEmailPlaceholder = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightRegular,
    color: AppColor.colorDialogTitleText,
  );

}