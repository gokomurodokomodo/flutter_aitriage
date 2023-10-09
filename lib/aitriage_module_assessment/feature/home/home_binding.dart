import 'package:flutter_aitriage/aitriage_module_assessment/data/repository/assessment_repository.dart';
import 'package:get/get.dart';
import '../../../aitriage_module_patient/domain/use_case/get_list_assessment_by_location_uc.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AssessmentRepositoryImpl());
    Get.lazyPut(() => GetListAssessmentByLocationUseCaseImpl(Get.find<AssessmentRepositoryImpl>()));
    Get.lazyPut(() => HomeController(Get.find<GetListAssessmentByLocationUseCaseImpl>()));
  }
}