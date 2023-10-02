import 'package:get/get.dart';
import '../../data/repository/sign_up_repository.dart';
import '../../domain/use_case/send_password_reset_verified_code_uc.dart';
import 'check_your_email_controller.dart';

class CheckYourEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpRepositoryImpl());
    Get.lazyPut(() => CheckYourEmailController(Get.find<SendPasswordResetVerifiedCodeUseCaseImpl>()));
  }
}