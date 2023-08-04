import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_aitriage/aitriage_module_main/feature/main_screen/main_controller.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _MainScreenTablet(),
        phone: _MainScreenPhone()
    );
  }
}

class _MainScreenTablet extends GetView<MainController> {
  const _MainScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _MainScreenPhone extends GetView<MainController> {
  const _MainScreenPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
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


