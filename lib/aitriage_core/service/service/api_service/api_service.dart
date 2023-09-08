
import 'package:get/get.dart';
import '../../../network/handle_error/handle_error.dart';
import '../../../util/global_function.dart';
import '../../usecase/get_country_uc.dart';
import '../../usecase/get_param_type_uc.dart';
import '../../usecase/get_system_param_uc.dart';
import '../../usecase/get_user_info_uc.dart';

class ApiService extends GetxService {
  final getCountryUseCase = GetCountryUseCase();
  final getSystemParamUseCase = GetSystemParamUseCase();
  final getUserInfoUseCase = GetUserInfoUseCase();
  final getParamTypeUseCase = GetParamTypeUseCase();

  @override
  void onInit() {
    super.onInit();
    _getCountry();
    _getSystemParam();
    _getParamType();
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

  void _getParamType() async {
    try {
      final resp = await getParamTypeUseCase.execute();
      paramTypes.addAll(resp.data);
    } catch (e) {
      HandleNetworkError.handleNetworkError(e, (message, _, __) => Get.snackbar('Error', message));
    }
  }
}