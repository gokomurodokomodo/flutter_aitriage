import 'package:flutter_aitriage/aitriage_core/service/api_service/api_service.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/register_uc.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/common/app_error.dart';
import '../../../aitriage_core/util/crypto/crypto.dart';
import '../../data/api/request/register_request.dart';

class SubmitInfoController extends GetxController {
  final RegisterUseCase _registerUseCase;
  var text = ''.obs;

  SubmitInfoController(this._registerUseCase);

  @override
  void onInit() {
    super.onInit();
    print(Get.arguments);
    _getCountry();
  }

  void _getCountry() async {
    final getCountryUseCase = Get.find<ApiService>().getCountryUseCase;

    try {
      final resp = await getCountryUseCase.execute();
      text.value = resp.data.first.emoji!;
    } catch(e) {
      if (e is AppError) Get.snackbar('Error', e.message);
    }
  }

  void submit() async {
    final encryptedPassword = await CryptoUtil.encrypt('Password123123!@#');
    final request = RegisterRequest(
        accountType: 'HOSPITAL',
        operatingStatus: 'COMING_SOON',
        businessOwner: 1,
        organizationName: 'HUETRANSKY',
        isoCode: 'VNM',
        email: 'hued11223@gmail.com',
        password: encryptedPassword,
        phone: '01234567891',
        firstName: 'firstName',
        lastName: 'lastName',
        confirm: 1
    );

    try {
      await _registerUseCase.execute(request);
    } catch (e) {
      if (e is AppError) Get.snackbar('Error', e.message);
    }
  }
}