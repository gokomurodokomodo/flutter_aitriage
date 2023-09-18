import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_in/sign_in_controller.dart';
import 'package:get/get.dart';
import '../../data/repository/sign_in_repository.dart';
import '../../data/repository/sign_up_repository.dart';
import '../../domain/use_case/sign_in_uc.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpRepositoryImpl());
    Get.lazyPut(() => SignInRepositoryImpl());
    Get.lazyPut(() => SignInUseCaseImpl(Get.find(), Get.find()));
    Get.lazyPut(() => SignInController(Get.find()));
  }
}