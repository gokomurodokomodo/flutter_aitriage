import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_color.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_core/util/debounce/debounce_util.dart';
import 'package:flutter_aitriage/aitriage_module_auth/config/auth_module_page_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/ui/widget/authentication_header.dart';
import '../../widget/auth_back_button.dart';
import '../../widget/sign_up_icon_wrapper.dart';
import '../../widget/step_count_widget.dart';

class ChooseHospitalScreen extends StatelessWidget{
  const ChooseHospitalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DeviceDetector(
        tablet: _Tablet(),
        phone: _Phone());
  }
}

class _Tablet extends StatefulWidget{
  @override
  State<_Tablet> createState() => _TabletState();
}

class _TabletState extends State<_Tablet> {
  var index = -1;
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
            AuthenticationHeader(
              svgIconName: AppImage.svgAppLogo,
              headerText: 'Start your 14-day free trial',
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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SignUpIconWrapper(
                    onTap: () => _onTapButton(0),
                    title: 'Hospital',
                    isSelected: index == 0,
                    child: Image.asset(AppImage.icHospital,
                        width: 160.h, height: 160.h)),
                SizedBox(width: 24.w),
                SignUpIconWrapper(
                    onTap: () => _onTapButton(1),
                    title: 'Clinics',
                    isSelected: index == 1,
                    child: Image.asset(AppImage.icClinic,
                        width: 160.h, height: 160.h)),
                SizedBox(width: 24.w),
                SignUpIconWrapper(
                    onTap: () => _onTapButton(3),
                    title: '3rd Party / Developer',
                    isSelected: index == 2,
                    child: Image.asset(AppImage.icDeveloper,
                        width: 160.h, height: 160.h))
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onTapButton(int newIndex) {
    var argument = '';
    setState(() => index = newIndex);

    switch (index) {
      case 0:
        argument = 'HOSPITAL';
        break;
      case 1:
        argument = 'CLINICS';
        break;
      case 2:
        argument = '3RD Party/ Developer';
        break;
    }

    debounce.run(() async {
      await Get.toNamed(AuthModulePageRoute.organizationInfo, arguments: {'accountType': argument});
      // reset selected button after back from next screen
      setState(() => index = -1);
    });
  }
}

class _Phone extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

}