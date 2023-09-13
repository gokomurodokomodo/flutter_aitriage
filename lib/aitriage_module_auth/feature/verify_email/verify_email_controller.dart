import 'package:flutter_aitriage/aitriage_core/network/handle_error/handle_error.dart';
import 'package:flutter_aitriage/aitriage_core/util/alert/alert_util.dart';
import 'package:flutter_aitriage/aitriage_core/util/crypto/crypto.dart';
import 'package:flutter_aitriage/aitriage_module_auth/data/api/request/verify_login_request.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/verify_email_uc.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/local_storage/flutter_secured_storage/response/get_active_user_information.dart';
import '../../data/api/request/verify_email_request.dart';

class VerifyEmailController extends GetxController {
  final VerifyEmailUseCase _uc;
  var _verifyCode = '';

  VerifyEmailController(this._uc);

  void onInputCompleted(String verifyCode) => _verifyCode = verifyCode;

  void onSubmit({
    Function(String)? onRegisterSuccess,
    Function? onLoginSuccess,
    Function(dynamic)? onError
  }) async {
    if(Get.arguments['userName'] == null){
      _onRegisterSubmit(onSuccess: onRegisterSuccess, onError: onError);
    } else {
      _onLoginSubmit(onSuccess: onLoginSuccess, onError: onError);
    }
  }

  String getEmail(){
    return Get.arguments?['email'];
  }

  Future<void> resendCode({
    Function(String)? onSuccess,
    Function(dynamic)? onError
  }) async{
    final email = Get.arguments?['email'];

    try{
      AlertUtil.showLoadingIndicator();
      final response = await _uc.resendSignUpVerificationCode(email);
      onSuccess?.call(response.message.toString());
    } catch (e){
      HandleNetworkError.handleNetworkError(e, (message, _, __) => onError?.call(e));
    }
  }


  Future<void> _onRegisterSubmit({
    Function(String)? onSuccess,
    Function(dynamic)? onError
  }) async {
    final argument = Get.arguments;
    final request = VerifyEmailRequest(
        email: argument?['email'],
        verificationCode: _verifyCode
    );

    try {
      AlertUtil.showLoadingIndicator();
      final resp = await _uc.execute(request);
      onSuccess?.call(resp.message.toString());
    } catch (e) {
      HandleNetworkError.handleNetworkError(e, (message, _, __) => onError?.call(e));
    }
  }

  void _onLoginSubmit({
    Function? onSuccess,
    Function(dynamic)? onError
  }) async {
    final argument = Get.arguments;
    // final userName = argument?['userName'];
    // final password = await CryptoUtil.encrypt(argument?['password']);
    final request = VerifyLoginRequest(
        userName: argument?['userName'],
        password: await CryptoUtil.encrypt(argument?['password']),
        verificationCode: _verifyCode);

    try {
      AlertUtil.showLoadingIndicator();
      final result = await _uc.loginWithVerificationCode(request);
      Get.back();
      Get.snackbar('Success', result.message.toString());
      // final key = '${AppConstant.preCharSaveUserData}$userName}';
      ActiveUserInformation.accessToken.setSecuredData(result.data.accessToken ?? '');
      onSuccess?.call();
    } catch (e) {
      HandleNetworkError.handleNetworkError(
          e, (message, _, __) => onError?.call(e));
    }
  }
}

