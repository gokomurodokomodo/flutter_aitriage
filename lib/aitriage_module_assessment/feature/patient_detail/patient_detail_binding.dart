import 'package:flutter_aitriage/aitriage_module_assessment/data/repository/patient_repository.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_gender_type_param_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/update_patient_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/patient_detail/patient_detail_controller.dart';
import 'package:get/get.dart';
import '../../domain/use_case/get_patient_detail_uc.dart';

class PatientDetailBinding extends Bindings {
  final dynamic argument;

  PatientDetailBinding(this.argument);

  @override
  void dependencies() {
    Get.lazyPut(() => PatientRepositoryImpl());
    Get.lazyPut(() => GetPatientDetailUseCaseImpl(Get.find<PatientRepositoryImpl>()));
    Get.lazyPut(() => GetGenderParamUseCaseImpl());
    Get.lazyPut(() => UpdatePatientUseCaseImpl(Get.find<PatientRepositoryImpl>()));
    Get.lazyPut(() => PatientDetailController(
        argument,
        Get.find<GetPatientDetailUseCaseImpl>(),
        Get.find<GetGenderParamUseCaseImpl>(),
        Get.find<UpdatePatientUseCaseImpl>(),
    ));
  }
}