import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_color.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_core/util/global_function.dart';
import 'package:flutter_aitriage/aitriage_module_auth/config/auth_module_page_route.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/register_account_type/register_account_type_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../aitriage_core/ui/widget/authentication_header.dart';
import '../../../widget/auth_back_button.dart';
import '../../../widget/sign_up_icon_wrapper.dart';
import '../../../widget/step_count_widget.dart';

class RegisterAccountTypeScreen extends StatelessWidget{
  const RegisterAccountTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DeviceDetector(
        tablet: const _Tablet(),
        phone: _Phone());
  }
}

class _Tablet extends GetView<RegisterAccountTypeController>{
  const _Tablet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorAppBackground,
      body: Padding(
        padding: EdgeInsets.all(40.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: AuthBackButton(onTap: () => Get.back())),
            SizedBox(height: 60.h),
            AuthenticationHeader(
              svgIconName: AppImage.svgAppLogo,
              headerText: 'Start your ${systemParam.trialTime}-day free trial',
              contentText: '100% free. No credit card needed',
              styleContentText: AppStyle.styleCheckYourEmailNotification,
            ),
            SizedBox(height: 24.h),
            SizedBox(
                width: (240.h * 3) + (24.w * 2),
                child: const StepCountWidget(index: 1)),
            SizedBox(height: 40.h),
            Text('Hospital or clinics', style: AppStyle.styleCheckYourEmailNotification),
            SizedBox(height: 24.h),
            Obx(() => Expanded(
              child: ListView.separated(
                itemCount: controller.vm.value.rowCount,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int rowIndex) {
                  final firstItemIndex = rowIndex * 3;
                  final secondItemIndex = rowIndex * 3 + 1;
                  final thirdItemIndex = rowIndex * 3 + 2;

                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: controller.vm.value.shouldShowThisItem(firstItemIndex),
                        child: SignUpIconWrapper(
                            onTap: () => _onTapButton(firstItemIndex),
                            title: controller.vm.value.itemTitle(firstItemIndex),
                            isSelected: controller.vm.value.isItemSelected(firstItemIndex),
                            child: CachedNetworkImage(
                                width: 160.h,
                                height: 160.h,
                                imageUrl: controller.vm.value.itemImageUrl(firstItemIndex)
                            )),
                      ),
                      SizedBox(width: 24.w),
                      Visibility(
                        visible: controller.vm.value.shouldShowThisItem(secondItemIndex),
                        child: SignUpIconWrapper(
                          onTap: () => _onTapButton(secondItemIndex),
                            title: controller.vm.value.itemTitle(secondItemIndex),
                            isSelected: controller.vm.value.isItemSelected(secondItemIndex),
                            child: CachedNetworkImage(
                                width: 160.h,
                                height: 160.h,
                                imageUrl: controller.vm.value.itemImageUrl(secondItemIndex)
                            )),
                      ),
                      SizedBox(width: 24.w),
                      Visibility(
                        visible: controller.vm.value.shouldShowThisItem(thirdItemIndex),
                        child: SignUpIconWrapper(
                          onTap: () => _onTapButton(thirdItemIndex),
                            title: controller.vm.value.itemTitle(thirdItemIndex),
                            isSelected: controller.vm.value.isItemSelected(thirdItemIndex),
                            child: CachedNetworkImage(
                                width: 160.h,
                                height: 160.h,
                                imageUrl: controller.vm.value.itemImageUrl(thirdItemIndex)
                            )),
                      ),
                    ],
                  );
                }, separatorBuilder: (BuildContext context, int index) => SizedBox(height: 24.h),
              ),
            )),
          ],
        ),
      ),
    );
  }

  void _onTapButton(int index) async {
    controller.onTapButton(index);
    final argument = controller.vm.value.itemArgument;
    await Get.toNamed(AuthModulePageRoute.registerAccountStatus, arguments: <String, dynamic>{'accountType': argument});
    // controller.resetView();
  }
}

class _Phone extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}