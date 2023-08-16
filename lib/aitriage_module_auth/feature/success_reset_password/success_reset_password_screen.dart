import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/authentication_header.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/color_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SuccessResetPasswordScreen extends StatelessWidget{
  const SuccessResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AuthenticationHeader(
            headerText: 'password_reset'.tr,
            contentText: 'password_reset_success'.tr,
          ),
          SizedBox(
            width: 450.w,
            child: ColorButton(
                title: 'sign_in'.tr,
                shouldEnable: true,
            ),
          ),
        ],
      ),
    );
  }

}