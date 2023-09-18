import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/add_patient_uc.dart';
import 'package:get/get.dart';
import '../../data/repository/patient_repository.dart';
import '../../domain/use_case/get_city_uc.dart';
import '../../domain/use_case/get_gender_uc.dart';
import '../../domain/use_case/get_nationality_uc.dart';
import '../../domain/use_case/get_race_uc.dart';
import '../../domain/use_case/get_state_uc.dart';
import 'add_new_patient_controller.dart';

class AddNewPatientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetGenderUseCaseImpl());
    Get.lazyPut(() => GetRaceUseCaseImpl());
    Get.lazyPut(() => GetCityUseCaseImpl());
    Get.lazyPut(() => GetStateUseCaseImpl());
    Get.lazyPut(() => PatientRepositoryImpl());
    Get.lazyPut(() => AddPatientUseCaseImpl(Get.find<PatientRepositoryImpl>()));
    Get.lazyPut(() => GetNationalityUseCaseImpl(Get.find<PatientRepositoryImpl>()));
    Get.lazyPut(() => AddNewPatientController(
        Get.find<GetGenderUseCaseImpl>(),
        Get.find<GetRaceUseCaseImpl>(),
        Get.find<GetNationalityUseCaseImpl>(),
        Get.find<GetCityUseCaseImpl>(),
        Get.find<GetStateUseCaseImpl>(),
        Get.find<AddPatientUseCaseImpl>()
    ));
  }
}