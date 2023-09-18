import 'package:flutter_aitriage/aitriage_module_auth/feature/verify_email/verify_email_controller.dart';
import 'package:get/get.dart';
import '../../data/repository/sign_in_repository.dart';
import '../../data/repository/sign_up_repository.dart';
import '../../domain/use_case/verify_email_uc.dart';

class VerifyEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpRepositoryImpl());
    Get.lazyPut(() => SignInRepositoryImpl());
    Get.lazyPut(() => VerifyEmailUseCaseImpl(Get.find<SignUpRepositoryImpl>(), Get.find()));
    Get.lazyPut(() => VerifyEmailController(Get.find<VerifyEmailUseCaseImpl>()));
  }
}