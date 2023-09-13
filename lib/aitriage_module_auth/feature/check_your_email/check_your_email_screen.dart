import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/authentication_header.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/back_to_login_text_button.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/color_button.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/common/app_color.dart';
import '../../../aitriage_core/common/app_image.dart';
import '../../../aitriage_core/common/app_style.dart';
import 'check_your_email_controller.dart';

class CheckYourEmailScreen extends StatelessWidget {
  const CheckYourEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DeviceDetector(
        tablet: const _Tablet(),
        phone: _Phone());
  }
}

class _Tablet extends GetView<CheckYourEmailController> {
  const _Tablet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorAppBackground,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 160.h),
            Obx(() => AuthenticationHeader(
              svgIconNameWithBorder: AppImage.svgEmail,
              headerText: 'check_your_email'.tr,
              contentText: 'we_sent_password'.tr,
              styleContentText: AppStyle.styleCheckYourEmailNotification,
              thirdText: controller.userEmail.value,
              styleThirdText: AppStyle.styleCheckYourEmail,
            )),
            SizedBox(height: 32.h,),
            ColorButton(
              shouldEnable: true,
              width: 360.w,
              title: 'open_email_app'.tr,
              onTap: (){
                controller.openEmailApp();
              },
            ),
            SizedBox(height: 32.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('didnt_receive_email'.tr),
                SizedBox(height: 4.w,),
                TextButton(
                    onPressed: () {
                      onError(error) => Get.snackbar('Error', error);
                      controller.resend(onError: onError);
                    },
                    child: Text('click_to_resend'.tr))
              ],
            ),
            SizedBox(height: 32.h,),
            const BackToLoginTextButton(),
          ],
        ),
      ),
    );
  }
}

class _Phone extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}