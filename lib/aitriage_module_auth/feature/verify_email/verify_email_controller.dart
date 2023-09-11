import 'package:flutter_aitriage/aitriage_core/common/app_constant.dart';
import 'package:flutter_aitriage/aitriage_core/network/handle_error/handle_error.dart';
import 'package:flutter_aitriage/aitriage_core/util/alert/alert_util.dart';
import 'package:flutter_aitriage/aitriage_core/util/crypto/crypto.dart';
import 'package:flutter_aitriage/aitriage_module_auth/data/api/request/verify_login_request.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/verify_email_uc.dart';
import 'package:flutter_aitriage/aitriage_module_main/config/main_route.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/service/service/local_storage_service/local_storage_service.dart';
import '../../data/api/request/verify_email_request.dart';

class VerifyEmailController extends GetxController {
  final VerifyEmailUseCase _uc;
  var _verifyCode = '';

  VerifyEmailController(this._uc);

  void onInputCompleted(String verifyCode) => _verifyCode = verifyCode;

  void onSubmit() async {
    if(Get.arguments['userName'] == null){
      _onRegisterSubmit();
    } else {
      _onLoginSubmit();
    }
  }

  String getEmail(){
    return Get.arguments?['email'];
  }

  Future<void> resendCode() async{
    final email = Get.arguments?['email'];

    try{
      AlertUtil.showLoadingIndicator();
      final response = await _uc.resendSignUpVerificationCode(email);
      Get.back();
      Get.snackbar('Success', response.message.toString());
    } catch (e){
      Get.back();
      HandleNetworkError.handleNetworkError(e, (message, _, __) => Get.snackbar('Error', message));
    }
  }


  Future<void> _onRegisterSubmit() async {
    final argument = Get.arguments;
    final request = VerifyEmailRequest(
        email: argument?['email'],
        verificationCode: _verifyCode
    );

    try {
      AlertUtil.showLoadingIndicator();
      final resp = await _uc.execute(request);
      Get.back();
      Get.snackbar('Success', resp.message.toString());
      await Get.offNamed(MainRoute.gettingStartedMain);
    } catch (e) {
      Get.back();
      HandleNetworkError.handleNetworkError(e, (message, _, __) => Get.snackbar('Error', message));
    }
  }

  void _onLoginSubmit() async {
    final argument = Get.arguments;
    final userName = argument?['userName'];
    final password = await CryptoUtil.encrypt(argument?['password']);
    final request = VerifyLoginRequest(
        userName: argument?['userName'],
        password: await CryptoUtil.encrypt(argument?['password']),
        verificationCode: _verifyCode);

    try {
      AlertUtil.showLoadingIndicator();
      final result = await _uc.loginWithVerificationCode(request);
      Get.back();
      Get.snackbar('Success', result.message.toString());
      final key = '${AppConstant.preCharSaveUserData}$userName}';
      final localStorageService = LocalStorageService();
      localStorageService.setSecuredUser(userName: userName, password: password);
      localStorageService.setSecuredUserData(key: key, data: result.data);
      localStorageService.removeSecured(key: AppConstant.firstDateOffline);
      localStorageService.setCurrentAccessToken(accessToken: result.data.accessToken ?? '');
      Get.toNamed(MainRoute.main);
    } catch (e) {
      Get.back();
      HandleNetworkError.handleNetworkError(
          e, (message, _, __) => Get.snackbar('Error', message));
    }
  }
}

