import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/add_patient_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_gender_type_param_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/update_patient_uc.dart';
import 'package:get/get.dart';
import '../../data/repository/patient_repository.dart';
import '../../domain/use_case/get_city_uc.dart';
import '../../domain/use_case/get_nationality_uc.dart';
import '../../domain/use_case/get_race_uc.dart';
import '../../domain/use_case/get_state_uc.dart';
import 'add_new_patient_controller.dart';

class AddNewPatientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetGenderParamUseCaseImpl());
    Get.lazyPut(() => GetRaceUseCaseImpl());
    Get.lazyPut(() => GetCityUseCaseImpl());
    Get.lazyPut(() => GetStateUseCaseImpl());
    Get.lazyPut(() => PatientRepositoryImpl());
    Get.lazyPut(() => AddPatientUseCaseImpl(Get.find<PatientRepositoryImpl>()));
    Get.lazyPut(() => UpdatePatientUseCaseImpl(Get.find<PatientRepositoryImpl>()));
    Get.lazyPut(() => AddNewPatientController(
        Get.find<GetGenderParamUseCaseImpl>(),
        Get.find<GetRaceUseCaseImpl>(),
        Get.find<GetCityUseCaseImpl>(),
        Get.find<GetStateUseCaseImpl>(),
        Get.find<AddPatientUseCaseImpl>(),
        Get.find<UpdatePatientUseCaseImpl>(),
    ));
  }
}