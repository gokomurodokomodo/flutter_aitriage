import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_city_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_gender_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_nationality_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_state_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/add_new_patient/add_new_patient_vm.dart';
import 'package:flutter_aitriage/aitriage_module_main/feature/home_main/home_main_controller.dart';
import 'package:get/get.dart';
import '../../domain/use_case/get_race_uc.dart';

class AddNewPatientController extends GetxController {
  final GetGenderUseCase _getGenderUC;
  final GetRaceUseCase _getRaceUC;
  final GetNationalityUseCase _getNationalityUC;
  final GetCityUseCase _getCityUC;
  final GetStateUseCase _getStateUC;
  final vm = AddNewPatientVM().obs;

  AddNewPatientController(
      this._getGenderUC,
      this._getRaceUC,
      this._getNationalityUC,
      this._getCityUC,
      this._getStateUC);

  @override
  void onInit() async {
    super.onInit();
    final countryId = Get.isRegistered<HomeMainController>()
        ? Get.find<HomeMainController>().countryId
        : '0';
    final genders = _getGenderUC.execute();
    final races = _getRaceUC.execute();
    final nationalities = await _getNationalityUC.execute();
    final cities = _getCityUC.execute(countryId);
    final states = _getStateUC.execute(countryId);
    vm.value.update(
        genders: genders,
        races: races,
        nationalities: nationalities,
        cities: cities,
        states: states,
        countryId: countryId
    );
    vm.refresh();
  }
}