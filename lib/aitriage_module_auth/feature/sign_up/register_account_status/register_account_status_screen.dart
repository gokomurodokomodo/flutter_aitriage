import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_aitriage/aitriage_core/util/debounce/debounce_util.dart';
import 'package:flutter_aitriage/aitriage_module_auth/config/auth_module_page_route.dart';
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
    return const DeviceDetector(
        tablet: _Tablet(),
        phone: _Phone()
    );
  }
}

class _Tablet extends StatefulWidget {
  const _Tablet({super.key});

  @override
  State<_Tablet> createState() => _TabletState();
}

class _TabletState extends State<_Tablet> {
  var operatingStatusIndex = -1;
  var businessOwnerIndex = -1;
  final debounce = DebounceUtil();

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
                    isSelected: operatingStatusIndex == 0,
                    onTap: () => _onTapOperatingStatus(0),
                    child: Image.asset(AppImage.icOngoing,
                        width: 160.h, height: 160.h)),
                SizedBox(width: 24.w),
                SignUpIconWrapper(
                    title: 'Opening Soon',
                    isSelected: operatingStatusIndex == 1,
                    onTap: () => _onTapOperatingStatus(1),
                    child: Image.asset(AppImage.icClinic,
                        width: 160.h, height: 160.h)),
                SizedBox(width: 24.w),
                SignUpIconWrapper(
                    title: 'I just learned about this app',
                    onTap: () => _onTapOperatingStatus(2),
                    isSelected: operatingStatusIndex == 2,
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
                    isSelected: businessOwnerIndex == 0,
                    onTap: () => _onTapBusinessOwnerStatus(0),
                    child: SvgIconWidget(
                        name: AppImage.svgSuccessAlert,
                        size: 80.h)),
                SizedBox(width: 24.w),
                SignUpIconWrapper(
                    title: 'No',
                    isSelected: businessOwnerIndex == 1,
                    onTap: () => _onTapBusinessOwnerStatus(1),
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

  void _onTapOperatingStatus(int newIndex) {
    setState(() => operatingStatusIndex = newIndex);
    _checkALlOptionsSelected();
  }

  void _onTapBusinessOwnerStatus(int newIndex) {
    setState(() => businessOwnerIndex = newIndex);
    _checkALlOptionsSelected();
  }

  void _checkALlOptionsSelected() async {
    var operatingStatus = '';
    // YES = 1, NO = 0
    final businessOwner = 1 - businessOwnerIndex;

    switch (operatingStatusIndex) {
      case 0:
        operatingStatus = 'ONGOING';
        break;
      case 1:
        operatingStatus = 'OPENING SOON';
        break;
      case 2:
        operatingStatus = '';
    }

    if (operatingStatusIndex != -1 && businessOwnerIndex != -1) {
      debounce.run(() async {
        final accountType = Get.arguments?['accountType'];
        await Get.toNamed(
            AuthModulePageRoute.submitInfo,
            arguments: {
              'accountType': accountType,
              'operatingStatus': operatingStatus,
              'businessOwner': businessOwner
            }
        );
        setState(() {
          operatingStatusIndex = -1;
          businessOwnerIndex = -1;
        });
      });
    }
  }
}

class _Phone extends StatelessWidget {
  const _Phone({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

