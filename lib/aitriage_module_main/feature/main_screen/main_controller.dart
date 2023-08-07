import 'package:flutter/cupertino.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/keep_alive_wrapper.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/config/assessment_navigator.dart';
import 'package:flutter_aitriage/aitriage_module_overview/config/overview_navigator.dart';
import 'package:flutter_aitriage/aitriage_module_setting/config/setting_navigator.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final modules = <Widget>[
    const KeepAliveWrapper(child: OverviewNavigator()),
    const KeepAliveWrapper(child: AssessmentNavigator()),
    const KeepAliveWrapper(child: SettingNavigator()),
  ];
  var currentIndex = 0.obs;
  final pageController = PageController();

  void updateTabBarViewIndex(int index) {
    pageController.jumpToPage(index);
    currentIndex.value = index;
  }
}