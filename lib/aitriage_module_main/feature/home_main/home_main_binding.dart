import 'package:flutter_aitriage/aitriage_module_auth/data/repository/sign_out_repository.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/sign_out_uc.dart';
import 'package:get/get.dart';
import '../../data/repository/get_list_location_repository.dart';
import '../../domain/use_case/get_list_location_uc.dart';
import 'home_main_controller.dart';

class HomeMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetListLocationRepositoryImpl());
    Get.lazyPut(() => GetListLocationUseCaseImpl(Get.find<GetListLocationRepositoryImpl>()));
    Get.lazyPut(() => SignOutRepositoryImpl());
    Get.lazyPut(() => SignOutUseCaseImpl(Get.find<SignOutRepositoryImpl>()));
    Get.lazyPut(() => HomeMainController(Get.find<GetListLocationUseCaseImpl>(), Get.find<SignOutUseCaseImpl>()));
  }
}