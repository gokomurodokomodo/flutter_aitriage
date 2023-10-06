import 'package:get/get.dart';
import '../../data/repository/patient_repository.dart';
import '../../domain/use_case/get_gender_type_param_uc.dart';
import '../../domain/use_case/get_list_patient_uc.dart';
import 'home_assessment_controller.dart';

class HomeAssessmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PatientRepositoryImpl());
    Get.lazyPut(() => GetListPatientUseCaseImpl(Get.find<PatientRepositoryImpl>()));
    Get.lazyPut(() => GetGenderParamUseCaseImpl());
    Get.lazyPut(() => HomeAssessmentController(
        Get.find<GetListPatientUseCaseImpl>(),
        Get.find<GetGenderParamUseCaseImpl>()
    ));
  }
}