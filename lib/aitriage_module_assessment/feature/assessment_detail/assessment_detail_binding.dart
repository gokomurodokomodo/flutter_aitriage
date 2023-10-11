import 'package:flutter_aitriage/aitriage_module_assessment/data/repository/assessment_repository.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/assessment_detail/assessment_detail_controller.dart';
import 'package:get/get.dart';
import '../../../aitriage_module_patient/domain/use_case/get_gender_type_param_uc.dart';
import '../../../aitriage_module_patient/domain/use_case/get_list_assessment_by_location_uc.dart';

class AssessmentDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AssessmentDetailController());
  }
}