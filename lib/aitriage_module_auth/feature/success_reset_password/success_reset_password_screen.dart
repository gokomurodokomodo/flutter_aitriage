import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/authentication_header.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/color_button.dart';
import 'package:flutter_aitriage/aitriage_module_auth/config/auth_module_page_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../aitriage_core/common/app_color.dart';
import '../../../aitriage_core/common/app_image.dart';

class SuccessResetPasswordScreen extends StatelessWidget{
  const SuccessResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorAppBackground,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200.h),
            AuthenticationHeader(
              svgIconNameWithBorder: AppImage.svgSuccess,
              headerText: 'password_reset'.tr,
              contentText: 'password_reset_success'.tr,
            ),
            SizedBox(height: 32.h),
            SizedBox(
              width: 450.w,
              child: ColorButton(
                  title: 'sign_in'.tr,
                  shouldEnable: true,
                  onTap: () => Get.toNamed(AuthModulePageRoute.signIn),
              ),
            ),
          ],
        ),
      ),
    );
  }

}