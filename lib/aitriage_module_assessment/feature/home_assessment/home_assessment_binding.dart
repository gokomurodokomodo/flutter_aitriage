import 'package:flutter_aitriage/aitriage_module_assessment/data/repository/assessment_repository.dart';
import 'package:get/get.dart';
import '../../../aitriage_module_patient/domain/use_case/get_gender_type_param_uc.dart';
import '../../../aitriage_module_patient/domain/use_case/get_list_assessment_by_location_uc.dart';
import 'home_assessment_controller.dart';

class HomeAssessmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AssessmentRepositoryImpl());
    Get.lazyPut(() => GetListAssessmentByLocationUseCaseImpl(Get.find<AssessmentRepositoryImpl>()));
    Get.lazyPut(() => GetGenderParamUseCaseImpl());
    Get.lazyPut(() => HomeAssessmentController(
        Get.find<GetListAssessmentByLocationUseCaseImpl>(),
        Get.find<GetGenderParamUseCaseImpl>()
    ));
  }
}