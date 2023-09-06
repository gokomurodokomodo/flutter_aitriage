import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_color.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/authentication_header.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_in_with_pincode/sign_in_with_pincode_controller.dart';
import 'package:flutter_aitriage/aitriage_module_auth/widget/input_pin_code.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/common/app_image.dart';
import '../../../aitriage_core/common/app_style.dart';
import '../../../aitriage_core/ui/widget/color_button.dart';

class SignInWithPinCodeScreen extends StatelessWidget {
  const SignInWithPinCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DeviceDetector(
        tablet: const _Tablet(),
        phone: _Phone()
    );

  }
}

class _Tablet extends GetView<SignInWithPinCodeController> {
  const _Tablet();
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColor.colorAppBackground,
        body: SingleChildScrollView(
          reverse: true,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 160.h),
                AuthenticationHeader(
                  svgIconName: AppImage.svgAppLogo,
                  headerText: 'welcome_back'.tr,
                ),
                SizedBox(height: 20.h,),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(120.r),
                        border: Border.all(color: AppColor.colorAppPrimary, width: 3)
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.red,radius: 50.w,
                      ),
                    ),
                    SvgIconWidget(name: AppImage.svgChangeCurrentUserAvatar, size: 30.w,),
                  ],
                ),
                SizedBox(height: 12.h,),
                Text('lorem.ipsum@gmail.com', style: AppStyle.styleTextEmailPlaceholder,),
                SizedBox(height: 24.h,),
                SizedBox(
                  width: 340.w,
                  height: 80.w,
                  child: InputPinCode(
                    shouldHideCode: false,
                    borderRadius: BorderRadius.circular(12.r),
                    fieldWidth: 70.w,
                    fieldHeight: 70.w,
                    lengthCode: 4,
                    appContext: context,
                    backgroundColor: Colors.white,
                  )
                ),
                SizedBox(height: 24.h,),
                SizedBox(
                    width: 340.w,
                    height: 40.w,
                    child: ColorButton(
                      title: 'sign_in'.tr,
                      shouldEnable: true,
                    ),
                  ),
              ],
            ),
          ),
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