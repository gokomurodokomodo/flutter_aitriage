import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_navigation_rail.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_aitriage/aitriage_module_main/feature/home_main/home_main_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/common/app_color.dart';

class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _Tablet(),
        phone: _Phone()
    );
  }
}

class _Tablet extends GetView<HomeMainController> {
  const _Tablet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorAppBackground,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Row(
          children: [
            SizedBox(
              width: 100.w,
              child: CustomNavigationRail(
                leading: const CircleAvatar(backgroundImage: AssetImage(AppImage.bgSplashScreen),radius: 25,),
                itemList: [
                  CustomNavigationRailItem(inactiveIcon: AppImage.svgOverviewInactive, activeIcon: AppImage.svgOverviewActive,),
                  CustomNavigationRailItem(inactiveIcon: AppImage.svgAssessmentInactive, activeIcon: AppImage.svgAssessmentActive,),
                  CustomNavigationRailItem(inactiveIcon:  AppImage.svgHelpInactive, activeIcon: AppImage.svgHelpActive,),
                  CustomNavigationRailItem(inactiveIcon:  AppImage.svgInfoInactive, activeIcon: AppImage.svgInfoActive,),
                  CustomNavigationRailItem(inactiveIcon:  AppImage.svgSettingInactive, activeIcon: AppImage.svgSettingActive,),
                ],
                onNavigationItemClick: (index) => controller.updateTabBarViewIndex(index),
              ),
            ),
            SizedBox(
              width: Get.width - 100.w,
              child: PageView(
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: controller.modules,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Phone extends GetView<HomeMainController> {
  const _Phone();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorAppBackground,
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: controller.modules,
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => controller.updateTabBarViewIndex(index),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: 'Overview',
              icon: SvgIconWidget(name: AppImage.svgOverviewInactive),
              activeIcon: SvgIconWidget(name: AppImage.svgOverviewActive)),
          BottomNavigationBarItem(
              label: 'Assessment',
              icon: SvgIconWidget(name: AppImage.svgAssessmentInactive),
              activeIcon: SvgIconWidget(name: AppImage.svgAssessmentActive)),
          BottomNavigationBarItem(
              label: 'Setting',
              icon: SvgIconWidget(name: AppImage.svgSettingInactive),
              activeIcon: SvgIconWidget(name: AppImage.svgSettingActive)),
        ],
      )),
    );
  }
}


