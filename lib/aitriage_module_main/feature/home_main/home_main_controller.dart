import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/hivi_service.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/keep_alive_wrapper.dart';
import 'package:flutter_aitriage/aitriage_core/util/active_user/active_user.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/config/assessment_module_navigator.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/sign_out_uc.dart';
import 'package:flutter_aitriage/aitriage_module_main/domain/use_case/get_list_location_uc.dart';
import 'package:flutter_aitriage/aitriage_module_main/feature/home_main/home_main_vm.dart';
import 'package:flutter_aitriage/aitriage_module_setting/config/setting_navigator.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/entity/table_sync_date.dart';
import '../../../aitriage_core/network/handle_error/handle_error.dart';
import '../../domain/entity/location.dart';

final modules = <Widget>[
  const KeepAliveWrapper(child: AssessmentModuleNavigator()),
  const KeepAliveWrapper(child: SettingNavigator()),
];

class HomeMainController extends GetxController {
  final GetListLocationUseCase _getListLocationUC;
  final SignOutUseCase _signOutUC;
  final vm = HomeMainVM().obs;
  StreamSubscription<TableSyncDate>? stream;

  HomeMainController(this._getListLocationUC, this._signOutUC);

  @override                                   
  void onInit() async {
    super.onInit();
    _getListLocation();
    final userInfo = await ActiveUserUtil.userInfo;
    vm.value.update(userInfo: userInfo);
    vm.refresh();

    stream = HiviService.instance.getFirebaseSyncDate.execute().listen((event) {
      log('FIREBASE SYNC START');
      HiviService.instance.syncData(firebaseSyncDate: event);
    });
  }

  @override
  void onClose() {
    super.onClose();
    stream?.cancel();
  }

  void _getListLocation() async {
    try {
      final user = await ActiveUserUtil.userInfo;
      final resp = await _getListLocationUC.execute(user.id.toString());
      vm.value.update(
          locations: resp.data,
          locationIndex: 0
      );
      vm.refresh();
    } catch (e) {
      log(e.toString());
    }
  }

  void changeLocation(int index) {
    vm.value.update(locationIndex: index);
    vm.refresh();
  }

  List<Location> get locations => vm.value.locations;

  Location get currentLocation => vm.value.currentLocation;

  Future<void> onTapUserButton(int index) async {
    switch (index) {
      case 3:
        try {
          await _signOutUC.execute();
        } catch (e) {
          HandleNetworkError.handleNetworkError(e, (message, _, __) {});
        }
      default:
    }
  }
}