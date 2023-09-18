import 'package:flutter/cupertino.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/keep_alive_wrapper.dart';
import 'package:flutter_aitriage/aitriage_core/util/active_user/active_user.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/config/assessment_module_navigator.dart';
import 'package:flutter_aitriage/aitriage_module_main/domain/use_case/get_list_location_uc.dart';
import 'package:flutter_aitriage/aitriage_module_setting/config/setting_navigator.dart';
import 'package:get/get.dart';

import '../../domain/entity/location.dart';

class HomeMainController extends GetxController {
  // Use case
  final GetListLocationUseCase _getListLocationUC;
  // Data
  final _locations = <Location>[];
  var _location = Location.fromJson(null);
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
    _getListLocation();
  }

  void _getListLocation() async {
    try {
      final user = await ActiveUserUtil.userInfo;
      final resp = await _getListLocationUC.execute(user.id.toString());
      _locations.addAll(resp.data);
      _location = resp.data.where((element) => element.countryId == 240).first;
    } catch (e) {

    }
  }

  void updateTabBarViewIndex(int index) {
    pageController.jumpToPage(index);
    currentIndex.value = index;
  }

  Location get location => _location;
}