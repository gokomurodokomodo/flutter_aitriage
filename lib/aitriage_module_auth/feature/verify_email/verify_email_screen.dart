import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../aitriage_core/common/app_color.dart';
import '../../../aitriage_core/common/app_image.dart';
import '../../../aitriage_core/common/app_style.dart';
import '../../../aitriage_core/ui/widget/authentication_header.dart';
import '../../../aitriage_core/ui/widget/color_button.dart';
import '../../widget/input_pin_code.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _Tablet(),
        phone: _Phone()
    );
  }
}

class _Tablet extends StatelessWidget {
  const _Tablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorAppBackground,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 160.h),
            AuthenticationHeader(
              svgIconNameWithBorder: AppImage.svgEmail,
              headerText: 'check_your_email'.tr,
              contentText: 'we_sent_password'.tr,
              styleContentText: AppStyle.styleCheckYourEmailNotification,
              thirdText: 'lorem.ipsum@gmail.com',
              styleThirdText: AppStyle.styleCheckYourEmail,
            ),
            SizedBox(height: 32.h),
            SizedBox(
              width: 360.w,
              child: InputPinCode(
                shouldHideCode: false,
                borderRadius: BorderRadius.circular(12.r),
                fieldWidth: 70.w,
                fieldHeight: 70.w,
                lengthCode: 4,
                appContext: context,
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 32.h),
            ColorButton(
              shouldEnable: true,
              width: 360.w,
              title: 'Verify email',
            ),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('didnt_receive_email'.tr),
                SizedBox(height: 4.w,),
                TextButton(
                    onPressed: () {  },
                    child: Text('click_to_resend'.tr))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Phone extends StatelessWidget {
  const _Phone({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

