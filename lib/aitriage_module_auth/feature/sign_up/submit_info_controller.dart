import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/register_uc.dart';
import 'package:get/get.dart';

import '../../data/api/request/register.dart';

class SubmitInfoController extends GetxController {
  final RegisterUseCase _registerUseCase;

  SubmitInfoController(this._registerUseCase);

  void submit() async {
    final request = RegisterRequest(
        accountType: 'HOSPITAL',
        operatingStatus: 'COMING_SOON',
        businessOwner: 1,
        organizationName: 'HUETRANSKY',
        isoCode: 'VNM',
        email: 'hue123@gmail.com',
        password: 'password',
        phone: '0123456789',
        firstName: 'firstName',
        lastName: 'lastName',
        confirm: 1
    );

    try {
      await _registerUseCase.execute(request);
    } catch (e) {
      print(e);
    }
  }
}