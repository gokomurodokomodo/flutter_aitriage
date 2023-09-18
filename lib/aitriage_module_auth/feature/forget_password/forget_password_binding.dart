import 'package:get/get.dart';
import '../../data/repository/forget_password_repository.dart';
import '../../domain/use_case/send_password_reset_verified_code_uc.dart';
import 'forget_password_controller.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordRepositoryImpl());
    Get.lazyPut(() => SendPasswordResetVerifiedCodeUseCaseImpl(Get.find<ForgetPasswordRepositoryImpl>()));
    Get.lazyPut(() => ForgetPasswordController(Get.find<SendPasswordResetVerifiedCodeUseCaseImpl>()));
  }
}