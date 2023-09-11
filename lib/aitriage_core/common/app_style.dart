import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_color.dart';

class AppStyle {
  AppStyle._();
  // Font size
  static final fontSizeMin = 10.0.sp;
  static final fontSizeName = 22.0.sp;
  static final fontSizeXS = 12.0.sp;
  static final fontSizeSM = 14.0.sp;
  static final fontSizeBase = 16.0.sp;
  static final fontSizeL = 18.0.sp;
  static final fontSizeXL = 20.0.sp;
  static final fontSize2XL = 24.0.sp;
  static final fontSize3XL = 26.0.sp;
  static final fontSize4XL = 30.0.sp;
  static final fontSize5XL = 32.0.sp;
  static final fontSize6XL = 36.0.sp;
  static final fontSize7XL = 48.0.sp;
  // Font weight
  static const fontWeightSemiBold = FontWeight.w600;
  static const fontWeight500 = FontWeight.w500;
  static const fontWeightRegular = FontWeight.w400;
  // Text style
  static final styleTextColorButtonEnable = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightRegular,
    color: AppColor.colorAppBackground,
  );
  static final styleTextColorButtonDisable = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightRegular,
    color: AppColor.colorButtonTextDisable,
  );
  static final styleTextDialogTitle = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightSemiBold,
    color: AppColor.colorDialogTitleText,
  );
  static final styleTextDashboardTitle = TextStyle(
    fontSize: fontSize2XL,
    fontWeight: fontWeightSemiBold,
    color: AppColor.colorDialogTitleText,
  );
  static final styleTextAlertHeader = TextStyle(
    fontSize: fontSizeXL,
    fontWeight: fontWeightSemiBold,
    color: AppColor.colorAlertHeader,
  );
  static final styleTextColorGetStarted = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightRegular,
    color: AppColor.colorTextGettingStarted,
  );
  static final styleDashboardPatientViewer = TextStyle(
    fontSize: fontSizeSM,
    fontWeight: fontWeightRegular,
    color: AppColor.colorCloseButton,
  );
  static final styleLoginHeader = TextStyle(
    fontSize: fontSize5XL,
    fontWeight: fontWeightSemiBold,
    color: AppColor.colorDialogTitleText,
  );
  static final styleCustomTextFieldHintText = TextStyle(
    fontSize: fontSizeSM,
    fontWeight: fontWeightRegular,
    color: AppColor.colorTextFieldPlaceHolder,
  );
  static final styleRememberMeText = TextStyle(
    fontSize: fontSizeSM,
    fontWeight: fontWeightRegular,
    color: AppColor.colorRememberMeText,
  );
  static final styleCheckYourEmailNotification = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightRegular,
    color: AppColor.colorRememberMeText,
  );
  static final styleTextButtonBackToLogin = TextStyle(
    fontSize: fontSizeSM,
    fontWeight: fontWeight500,
    color: AppColor.colorRememberMeText,
  );
  static final styleCheckYourEmail = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightSemiBold,
    color: AppColor.colorRememberMeText,
  );
  static final styleTextEmailPlaceholder = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightRegular,
    color: AppColor.colorDialogTitleText,
  );
  static final styleTextLabelIntro = TextStyle(
    fontSize: fontSize3XL,
    fontWeight: fontWeightRegular,
    color: AppColor.colorRememberMeText,
  );
  static final styleIntroSuggest2 = TextStyle(
    fontSize: fontSizeSM,
    fontWeight: fontWeightRegular,
    color: AppColor.colorTextPinCode,
  );
  static final styleGettingStartedItemTitle = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightRegular,
    color: AppColor.colorTextPinCode,
  );
  static final styleAssessmentItemTitle = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightSemiBold,
    color: AppColor.colorDialogTitleText,
  );
  static final styleAssessmentItemLabel = TextStyle(
    fontSize: fontSizeXS,
    fontWeight: fontWeightRegular,
    color: AppColor.colorRememberMeText,
  );
  static final styleAssessmentSummaryText = TextStyle(
    fontSize: fontSizeSM,
    fontWeight: fontWeight500,
    color: AppColor.colorTextPinCode,
  );
  static final styleTextTextRaisedPercent = TextStyle(
    fontSize: fontSizeSM,
    fontWeight: fontWeight500,
    color: AppColor.colorTextRaisedPercent,
  );
  static final styleTextAllPatientsHeader = TextStyle(
    fontSize: fontSizeXL,
    fontWeight: fontWeightSemiBold,
    color: AppColor.colorDialogTitleText,
  );
  static final styleTextAllPatientCategory = TextStyle(
      fontSize: fontSizeSM,
      fontWeight: fontWeight500,
      color: AppColor.colorCloseButton);
  static final stylePatientItemLabel = TextStyle(
    fontSize: fontSizeSM,
    fontWeight: fontWeightRegular,
    color: AppColor.colorDialogTitleText,
  );
  static final styleHintTextSearchBar = TextStyle(
    fontSize: fontSizeXS,
    fontWeight: fontWeightRegular,
    color: AppColor.colorTextFieldPlaceHolder,
  );
  static final styleRecordVitalSignsActive = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeight500,
    color: AppColor.colorTextPinCode,
  );
  static final styleRecordVitalSignsInactive = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightRegular,
    color: AppColor.colorCloseButton,
  );
  static final styleCancelAssessment = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightRegular,
    color: AppColor.colorTextCancelAssessment,
  );
  static final styleErrorText = TextStyle(
    fontSize: fontSizeSM,
    fontWeight: fontWeightRegular,
    color: AppColor.colorTextCancelAssessment,
  );
  static final styleStepItemProcessing = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightSemiBold,
    color: AppColor.colorAppBackground,
  );
  static final styleStepItemPending = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightSemiBold,
    color: AppColor.colorTextFieldPlaceHolder,
  );
  static final styleTextDropDownButton = TextStyle(
    fontSize: fontSizeSM,
    fontWeight: fontWeight500,
    color: AppColor.colorDialogTitleText,
  );
  static final styleTextPageNavigatorItemEnable = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeight500,
    color: AppColor.colorRailHover,
  );
  static final styleTextDialogHeaderTitle = TextStyle(
    fontSize: fontSizeL,
    fontWeight: fontWeightSemiBold,
    color: AppColor.colorDialogTitleText,
  );
  static final styleForgotPassword = TextStyle(
    fontSize: fontSizeSM,
    fontWeight: fontWeight500,
    color: AppColor.colorForgotPassword
  );
}