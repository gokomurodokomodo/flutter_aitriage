import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_list_patient_uc.dart';
import 'package:get/get.dart';
import '../../data/repository/patient_repository.dart';
import 'home_assessment_controller.dart';

class HomeAssessmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PatientRepositoryImpl());
    Get.lazyPut(() => GetListPatientUseCaseImpl(Get.find<PatientRepositoryImpl>()));
    Get.lazyPut(() => HomeAssessmentController(Get.find<GetListPatientUseCaseImpl>()));
  }
}