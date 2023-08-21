import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/authentication_header.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../aitriage_core/common/app_color.dart';
import '../../../aitriage_core/common/app_image.dart';
import '../../../aitriage_core/common/app_style.dart';
import '../../widget/get_started_main_column_item.dart';

class GettingStartedMainScreen extends StatelessWidget {
  const GettingStartedMainScreen({super.key});

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
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 120.h),
            AuthenticationHeader(
              svgIconNameWithBorder: AppImage.svgInformation,
              headerText: 'get_started_with_aitriage'.tr,
            ),
            SizedBox(height: 32.h),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 330.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const GetStartedMainColumnItem(
                          title: '1. Assessment',
                          label: 'Display patient information, as well as manipulate additional patients',
                          buttonTitle: 'Try now',
                          state: GetStartedItemState.finished,
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.5.h,
                          color: AppColor.colorRememberMeText.withOpacity(0.25),
                        ),
                        const GetStartedMainColumnItem(
                          title: '2. Look up results',
                          label: 'Display patient information results after diagnosis',
                          buttonTitle: 'Look up',
                          state: GetStartedItemState.running,
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.5.h,
                          color: AppColor.colorRememberMeText.withOpacity(0.25),
                        ),
                        const GetStartedMainColumnItem(
                          title: '1. Patient information',
                          label: 'Display patient information results after diagnosis',
                          buttonTitle: 'View info',
                          state: GetStartedItemState.ready,
                        ),
                        Row(
                          children: [const Spacer(), Text('Skip', style: AppStyle.styleGettingStartedItemTitle)],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 56.w),
                Container(
                  height: 330.h,
                  width: 480.w,
                  color: Colors.blue,
                ),
              ],
            ).paddingSymmetric(horizontal: 160.w)
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


