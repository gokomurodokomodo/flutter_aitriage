import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_aitriage/aitriage_module_main/feature/home_main/home_main_controller.dart';
import 'package:get/get.dart';

class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _HomeMainScreenTablet(),
        phone: _HomeMainScreenPhone()
    );
  }
}

class _HomeMainScreenTablet extends GetView<HomeMainController> {
  const _HomeMainScreenTablet();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _HomeMainScreenPhone extends GetView<HomeMainController> {
  const _HomeMainScreenPhone();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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


