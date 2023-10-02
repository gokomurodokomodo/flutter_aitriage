import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_in_with_pincode/sign_in_with_pincode_controller.dart';
import 'package:get/get.dart';

class SignInWithPinCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInWithPinCodeController());
  }
}