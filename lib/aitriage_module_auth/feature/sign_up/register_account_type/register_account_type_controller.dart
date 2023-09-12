import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/register_account_type/register_account_type_vm.dart';
import 'package:get/get.dart';
import '../../../../aitriage_core/entity/param_type.dart';
import '../../../../aitriage_core/service/hivi_service/hivi_service.dart';
import '../../../../aitriage_core/service/hivi_service/response/get_param_type_response.dart';
import '../../../../aitriage_core/util/global_function.dart';

class RegisterAccountTypeController extends GetxController {
  final vm = RegisterAccountTypeVM().obs;

  RegisterAccountTypeController();

  @override
  void onInit() {
    super.onInit();
    final hiviService = Get.find<HiviService>();
    _updateView(trialTime: hiviService.trialTime);
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
    int? buttonSelectedIndex,
    String? trialTime
  }) {
    vm.value.updateVM(
        list: list,
        buttonSelectedIndex: buttonSelectedIndex,
        trialTime: trialTime
    );
    vm.refresh();
  }

  void onTapButton(int index) {
    _updateView(buttonSelectedIndex: index);
  }
}