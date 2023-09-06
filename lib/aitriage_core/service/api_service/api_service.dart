import 'package:flutter_aitriage/aitriage_core/service/api_service/get_country/get_country_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/api_service/get_system_param/get_system_param_uc.dart';
import 'package:flutter_aitriage/aitriage_core/service/api_service/get_user_info/user_info.dart';
import 'package:get/get.dart';
import '../../network/handle_error/handle_error.dart';
import '../../util/global_function.dart';
import 'get_user_info/get_user_info_uc.dart';

class ApiService extends GetxService {
  final getCountryUseCase = GetCountryUseCase();
  final getSystemParamUseCase = GetSystemParamUseCase();
  final getUserInfoUseCase = GetUserInfoUseCase();

  @override
  void onInit() {
    super.onInit();
    _getCountry();
    _getSystemParam();
  }

  void _getCountry() async {
    try {
      final resp = await getCountryUseCase.execute();
      countryList.addAll(resp.data);
    } catch (e) {
      HandleNetworkError.handleNetworkError(e, (message, _, __) => Get.snackbar('Error', message));
    }
  }

  void _getSystemParam() async {
    try {
      final resp = await getSystemParamUseCase.execute();
      systemParam = resp.data;
    } catch (e) {
      HandleNetworkError.handleNetworkError(e, (message, _, __) => Get.snackbar('Error', message));
    }
  }
}