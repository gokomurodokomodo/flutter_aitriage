import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_aitriage/aitriage_module_auth/config/auth_module_page_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../aitriage_core/common/app_color.dart';
import '../../../aitriage_core/common/app_image.dart';
import '../../../aitriage_core/common/app_style.dart';
import '../../widget/auth_back_button.dart';
import '../../widget/sign_up_icon_wrapper.dart';
import '../../widget/step_count_widget.dart';

class OrganizationInfoScreen extends StatelessWidget {
  const OrganizationInfoScreen({super.key});

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
            Text('Your organization information', style: AppStyle.styleCheckYourEmailNotification),
            SizedBox(height: 24.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SignUpIconWrapper(
                    title: 'Ongoing',
                    isSelected: true,
                    child: Image.asset(AppImage.icOngoing,
                        width: 160.h, height: 160.h)),
                SizedBox(width: 24.w),
                SignUpIconWrapper(
                    title: 'Opening Soon',
                    isSelected: false,
                    child: Image.asset(AppImage.icClinic,
                        width: 160.h, height: 160.h)),
                SizedBox(width: 24.w),
                SignUpIconWrapper(
                    title: 'I just learned about this app',
                    isSelected: false,
                    child: Image.asset(AppImage.icDeveloper,
                        width: 160.h, height: 160.h))
              ],
            ),
            SizedBox(height: 32.h),
            Text('Are you the business owner or manager?', style: AppStyle.styleCheckYourEmailNotification),
            SizedBox(height: 24.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SignUpIconWrapper(
                    title: 'Yes',
                    isSelected: true,
                    onTap: () => Get.toNamed(AuthModulePageRoute.submitInfo),
                    child: SvgIconWidget(
                        name: AppImage.svgSuccessAlert,
                        size: 80.h)),
                SizedBox(width: 24.w),
                SignUpIconWrapper(
                    title: 'No',
                    isSelected: false,
                    onTap: () => Get.toNamed(AuthModulePageRoute.submitInfo),
                    child: SvgIconWidget(
                        name: AppImage.svgFailedAlert,
                        size: 80.h,)),
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

