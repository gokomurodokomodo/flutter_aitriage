import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/hivi_service.dart';
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
  final locations = <Location>[].obs;
  var location = Location.fromJson(null).obs;
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

    final hiviService = Get.find<HiviService>();
    hiviService.getFirebaseSyncDate.execute().listen((event) {
      print('Firebase sync date ${event.city}');
    });
  }

  void _getListLocation() async {
    try {
      final user = await ActiveUserUtil.userInfo;
      final resp = await _getListLocationUC.execute(user.id.toString());
      locations.addAll(resp.data);
      location.value = resp.data.first;
    } catch (e) {
      log(e.toString());
    }
  }

  void updateTabBarViewIndex(int index) {
    pageController.jumpToPage(index);
    currentIndex.value = index;
  }

  void changeLocation(int index) {
    location.value = locations[index];
  }
}