import 'package:flutter_aitriage/aitriage_core/service/api_service/api_service.dart';
import 'package:flutter_aitriage/aitriage_core/service/entity/param_type.dart';
import 'package:flutter_aitriage/aitriage_core/service/api_service/get_param_type/param_type_group_type.dart';
import 'package:flutter_aitriage/aitriage_core/util/alert/alert_util.dart';
import 'package:flutter_aitriage/aitriage_core/util/global_function.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/register_account_status/register_account_status_vm.dart';
import 'package:get/get.dart';

class RegisterAccountStatusController extends GetxController {
  final vm = RegisterAccountStatusVM().obs;

  RegisterAccountStatusController();

  @override
  void onReady() {
    super.onReady();
    _getParam();
  }

  void _getParam() async {
    final list = paramTypes
        .where((e) => e.groupType == ParamTypeGroupType.registerAccountStatus.stringValue)
        .toList();
    _updateView(list: list);
  }

  void _updateView({
    List<ParamType>? list,
    int? buttonStatusIndex,
    int? buttonYesNoIndex,
  }) {
    vm.value.updateVM(
      list: list,
      buttonStatusIndex: buttonStatusIndex,
      buttonYesNoIndex: buttonYesNoIndex
    );
    vm.refresh();
  }

  void onTapStatusButton(int index) {
    _updateView(buttonStatusIndex: index);
  }

  void onTapYesNoButton(int index) {
    _updateView(buttonYesNoIndex: index);
  }
}