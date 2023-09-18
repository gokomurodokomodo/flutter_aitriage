import 'package:flutter/cupertino.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/keep_alive_wrapper.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/config/assessment_module_navigator.dart';
import 'package:flutter_aitriage/aitriage_module_main/domain/use_case/get_list_location_uc.dart';
import 'package:flutter_aitriage/aitriage_module_setting/config/setting_navigator.dart';
import 'package:get/get.dart';

class HomeMainController extends GetxController {
  // Use case
  final GetListLocationUseCase _getListLocationUC;
  //
  final modules = <Widget>[
    const KeepAliveWrapper(child: AssessmentModuleNavigator()),
    const KeepAliveWrapper(child: SettingNavigator()),
  ];
  var currentIndex = 0.obs;
  final pageController = PageController();

  HomeMainController(this._getListLocationUC);

  @override
  void onInit() {
    super.onInit();
    _getListLocationUC.execute('2');
  }

  void updateTabBarViewIndex(int index) {
    pageController.jumpToPage(index);
    currentIndex.value = index;
  }
}