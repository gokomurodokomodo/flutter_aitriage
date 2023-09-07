import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/register_account_type/register_account_type_vm.dart';
import 'package:get/get.dart';
import '../../../../aitriage_core/entity/param_type.dart';
import '../../../../aitriage_core/service/api_service/get_param_type/param_type_group_type.dart';
import '../../../../aitriage_core/util/global_function.dart';

class RegisterAccountTypeController extends GetxController {
  final vm = RegisterAccountTypeVM().obs;

  RegisterAccountTypeController();

  @override
  void onReady() {
    super.onReady();
    _getParam();
  }

  void _getParam() async {
    final list = paramTypes
        .where((e) => e.groupType == ParamTypeGroupType.registerAccountType.stringValue)
        .toList();
    _updateView(list: list);
  }

  void _updateView({
    List<ParamType>? list,
    int? buttonSelectedIndex
  }) {
    vm.value.updateVM(
        list: list,
        buttonSelectedIndex: buttonSelectedIndex
    );
    vm.refresh();
  }

  void onTapButton(int index) {
    _updateView(buttonSelectedIndex: index);
  }
}