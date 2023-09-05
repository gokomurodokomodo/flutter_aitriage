import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/get_register_account_param_uc.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/register_account_status/register_account_status_vm.dart';
import 'package:get/get.dart';
import '../../../data/api/query/register_account_query.dart';
import '../../../domain/entity/register_account_param.dart';

class RegisterAccountStatusController extends GetxController {
  final GetRegisterAccountParamUseCase _useCase;
  final vm = RegisterAccountStatusVM().obs;

  RegisterAccountStatusController(this._useCase);

  @override
  void onInit() {
    super.onInit();
    _getParam();
  }

  void _getParam() async {
    final query = RegisterAccountQuery(RegisterAccountQueryEnum.registerAccountStatus);
    final resp = await _useCase.execute(query);
    _updateView(list: resp.data);
  }

  void _updateView({
    List<RegisterAccountParam>? list,
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

  // void resetView() {
  //   _updateView(
  //       buttonStatusIndex: -1,
  //       buttonYesNoIndex: -1
  //   );
  // }
}