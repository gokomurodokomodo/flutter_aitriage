import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/authentication_header.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_module_authen/config/authen_route.dart';
import 'package:flutter_aitriage/aitriage_module_authen/feature/sign_in_with_pincode/sign_in_with_pincode_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../aitriage_core/common/app_image.dart';
import '../../../aitriage_core/ui/widget/color_button.dart';
import '../../../aitriage_core/ui/widget/custom_login_field.dart';

class SignInPageWithPinCode extends GetView<SignInWithPinCodeController>{
  const SignInPageWithPinCode({super.key});

  @override
  Widget build(BuildContext context) {
    return DeviceDetector(
        tablet: _Tablet(controller: controller,), 
        phone: _Phone()
    );

  }
}

class _Tablet extends StatelessWidget{
  final SignInWithPinCodeController controller;
  
  const _Tablet({required this.controller});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            AuthenticationHeader(
              iconName: AppImage.svgAppLogo,
              headerText: 'welcome_back'.tr,
              contentText: 'enter_your_details'.tr,
            ),
            CircleAvatar(
              backgroundImage: const AssetImage(AppImage.bgSplashScreen),radius: 38.w,
            ),
            SizedBox(height: 8.h,),
            const Text('lorem.ipsum@gmail.com'),
            SizedBox(height: 20.h,),
            SizedBox(
              child: CustomLoginField(
                onTextChange: (_) => controller.onTextPinCodeChange(_),
                // isValidated: widget.controller.isValidEmail.value,
                label: 'pin_code_label'.tr,
                hintText: 'pin_code_hint'.tr,
                shouldSecured: true,
              ),
            ),
            SizedBox(height: 24.h,),
            SizedBox(
                width: 450.w,
                child: ColorButton(
                  title: 'sign_in'.tr,
                  shouldEnable: true,
                ),
              ),
            SizedBox(height: 32.h,),
            TextButton(onPressed: (){
              Get.offNamed(AuthenRoute.signIn);
            }, child: Text('use_another_account'.tr))
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