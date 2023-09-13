import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_aitriage/aitriage_module_auth/config/auth_module_page_route.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/controller/sign_up_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../aitriage_core/common/app_color.dart';
import '../../../../aitriage_core/common/app_image.dart';
import '../../../../aitriage_core/common/app_style.dart';
import '../../../widget/auth_back_button.dart';
import '../../../widget/sign_up_icon_wrapper.dart';
import '../../../widget/step_count_widget.dart';

class RegisterAccountStatusScreen extends StatelessWidget {
  const RegisterAccountStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DeviceDetector(
        tablet: _Tablet(),
        phone: const _Phone()
    );
  }
}

class _Tablet extends StatelessWidget {
  _Tablet();
  final SignUpController controller = Get.find<SignUpController>();

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
            SizedBox(
                width: (240.h * 3) + (24.w * 2),
                child: const StepCountWidget(index: 2)),
            SizedBox(height: 40.h),
            Text('your_organization_information'.tr, style: AppStyle.styleCheckYourEmailNotification),
            SizedBox(height: 24.h),
            Obx(() => Expanded(
                child: ListView.separated(
                    // Last Row for fixed business owner row
                    itemCount: controller.accountStatusVM.value.rowCount,
                    itemBuilder: (_, rowIndex) {
                      // Check if last row
                      if (controller.accountStatusVM.value.isFirstView(rowIndex)) {
                        final firstItemIndex = rowIndex * 3;
                        final secondItemIndex = rowIndex * 3 + 1;
                        final thirdItemIndex = rowIndex * 3 + 2;

                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: controller.accountStatusVM.value.shouldShowThisItem(firstItemIndex),
                              child: SignUpIconWrapper(
                                  onTap: () => _onTapStatusButton(firstItemIndex),
                                  title: controller.accountStatusVM.value.itemTitle(firstItemIndex),
                                  isSelected: controller.accountStatusVM.value.isStatusButtonSelected(firstItemIndex),
                                  child: CachedNetworkImage(
                                      width: 160.h,
                                      height: 160.h,
                                      imageUrl: controller.accountStatusVM.value.itemImageUrl(firstItemIndex)
                                  )),
                            ),
                            SizedBox(width: 24.w),
                            Visibility(
                              visible: controller.accountStatusVM.value.shouldShowThisItem(secondItemIndex),
                              child: SignUpIconWrapper(
                                  onTap: () => _onTapStatusButton(secondItemIndex),
                                  title: controller.accountStatusVM.value.itemTitle(secondItemIndex),
                                  isSelected: controller.accountStatusVM.value.isStatusButtonSelected(secondItemIndex),
                                  child: CachedNetworkImage(
                                      width: 160.h,
                                      height: 160.h,
                                      imageUrl: controller.accountStatusVM.value.itemImageUrl(secondItemIndex)
                                  )),
                            ),
                            SizedBox(width: 24.w),
                            Visibility(
                              visible: controller.accountStatusVM.value.shouldShowThisItem(thirdItemIndex),
                              child: SignUpIconWrapper(
                                  onTap: () => _onTapStatusButton(thirdItemIndex),
                                  title: controller.accountStatusVM.value.itemTitle(thirdItemIndex),
                                  isSelected: controller.accountStatusVM.value.isStatusButtonSelected(thirdItemIndex),
                                  child: CachedNetworkImage(
                                      width: 160.h,
                                      height: 160.h,
                                      imageUrl: controller.accountStatusVM.value.itemImageUrl(thirdItemIndex)
                                  )),
                            ),
                          ],
                        );
                      }

                      return Column(
                        children: [
                          SizedBox(height: 32.h),
                          Text('business_owner_or_manager'.tr, style: AppStyle.styleCheckYourEmailNotification),
                          SizedBox(height: 24.h),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SignUpIconWrapper(
                                  title: 'yes'.tr,
                                  isSelected: controller.accountStatusVM.value.isYesNoButtonSelected(0),
                                  onTap: () => _onTapYesNoButton(0),
                                  child: SvgIconWidget(
                                      name: AppImage.svgSuccessAlert,
                                      size: 80.h)),
                              SizedBox(width: 24.w),
                              SignUpIconWrapper(
                                  title: 'no'.tr,
                                  isSelected: controller.accountStatusVM.value.isYesNoButtonSelected(1),
                                  onTap: () => _onTapYesNoButton(1),
                                  child: SvgIconWidget(
                                    name: AppImage.svgFailedAlert,
                                    size: 80.h,)),
                            ],
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int rowIndex) => SizedBox(height: 32.r),
                ))),
          ],
        ),
      ),
    );
  }

  void _onTapStatusButton(int index) {
    controller.onAccountStatusTapStatusButton(index);
    _navigateToNextScreen();
  }

  void _onTapYesNoButton(int index) {
    controller.onAccountStatusTapYesNoButton(index);
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    if (controller.accountStatusVM.value.shouldNavigateToNextScreen) {
      await Get.toNamed(AuthModulePageRoute.submitInfo);
      // controller.resetView();
    }
  }
}

class _Phone extends StatelessWidget {
  const _Phone();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

