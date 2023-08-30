import 'package:flutter_aitriage/aitriage_module_auth/data/api/query/register_account_query.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/get_register_account_param_uc.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/register_account_type/register_account_type_vm.dart';
import 'package:get/get.dart';

import '../../../domain/entity/register_account_param.dart';

class RegisterAccountTypeController extends GetxController {
  final GetRegisterAccountParamUseCase _useCase;
  final vm = RegisterAccountTypeVM().obs;

  RegisterAccountTypeController(this._useCase);

  @override
  void onInit() {
    super.onInit();
    _getParam();
  }

  void _getParam() async {
    final query = RegisterAccountQuery(RegisterAccountQueryEnum.registerAccountType);
    final resp = await _useCase.execute(query);
    _updateView(list: resp.data);
  }

  void _updateView({
    List<RegisterAccountParam>? list,
    int? buttonSelectedIndex
  }) {
    vm.value.updateVM(
        list: list,
        buttonSelectedIndex: buttonSelectedIndex
    );
    vm.refresh();
  }

  void resetView() {
    _updateView(buttonSelectedIndex: -1);
  }

  void onTapButton(int index) {
    _updateView(buttonSelectedIndex: index);
  }
}