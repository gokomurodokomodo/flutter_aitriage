import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/get_register_account_param_uc.dart';
import 'package:get/get.dart';

class RegisterAccountStatusController extends GetxController {
  final GetRegisterAccountParamUseCase _useCase;

  RegisterAccountStatusController(this._useCase);
}