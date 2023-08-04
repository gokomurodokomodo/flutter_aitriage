import 'package:flutter/cupertino.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/keep_alive_wrapper.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/home_assessment/home_assessment_screen.dart';
import 'package:flutter_aitriage/aitriage_module_setting/feature/home_setting/home_setting_screen.dart';
import 'package:get/get.dart';
import '../../../aitriage_module_overview/feature/home_overview/home_overview_screen.dart';

class MainController extends GetxController {
  final modules = <Widget>[
    const KeepAliveWrapper(child: HomeOverviewScreen()),
    const KeepAliveWrapper(child: HomeAssessmentScreen()),
    const KeepAliveWrapper(child: HomeSettingScreen()),
  ];
  var currentIndex = 0.obs;
  final pageController = PageController();

  void updateTabBarViewIndex(int index) {
    pageController.jumpToPage(index);
    currentIndex.value = index;
  }
}