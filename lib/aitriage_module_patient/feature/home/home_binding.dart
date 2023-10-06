import 'package:get/get.dart';
import '../../data/repository/patient_repository.dart';
import '../../domain/use_case/get_gender_type_param_uc.dart';
import '../../domain/use_case/get_list_patient_uc.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PatientRepositoryImpl());
    Get.lazyPut(() => GetListPatientUseCaseImpl(Get.find<PatientRepositoryImpl>()));
    Get.lazyPut(() => GetGenderParamUseCaseImpl());
    Get.lazyPut(() => HomeController(
        Get.find<GetListPatientUseCaseImpl>(),
        Get.find<GetGenderParamUseCaseImpl>()
    ));
  }
}