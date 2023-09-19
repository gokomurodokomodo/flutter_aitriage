import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/add_patient_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_city_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_gender_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_nationality_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_state_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/add_new_patient/add_new_patient_vm.dart';
import 'package:flutter_aitriage/aitriage_module_main/feature/home_main/home_main_controller.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/entity/patient.dart';
import '../../../aitriage_core/network/handle_error/handle_error.dart';
import '../../../aitriage_core/util/active_user/active_user.dart';
import '../../domain/use_case/get_race_uc.dart';

class AddNewPatientController extends GetxController {
  final GetGenderUseCase _getGenderUC;
  final GetRaceUseCase _getRaceUC;
  final GetNationalityUseCase _getNationalityUC;
  final GetCityUseCase _getCityUC;
  final GetStateUseCase _getStateUC;
  final AddPatientUseCase _addPatientUC;
  final vm = AddNewPatientVM().obs;

  AddNewPatientController(
      this._getGenderUC,
      this._getRaceUC,
      this._getNationalityUC,
      this._getCityUC,
      this._getStateUC,
      this._addPatientUC
  );

  @override
  void onInit() async {
    super.onInit();
    final location = Get.isRegistered<HomeMainController>()
        ? Get.find<HomeMainController>().location
        : null;
    final locationId = location?.countryId;
    final genders = _getGenderUC.execute();
    final races = _getRaceUC.execute();
    final nationalities = await _getNationalityUC.execute();
    final cities = _getCityUC.execute(locationId.toString());
    final states = _getStateUC.execute(locationId.toString());
    vm.value.update(
        genders: genders,
        races: races,
        nationalities: nationalities,
        cities: cities,
        states: states,
        locationId: locationId
    );
    vm.refresh();
  }

  void onTapSavePatient({
    Function? onSuccess,
    Function? onError
  }) async {
    try {
      final request = vm.value.getAddPatientRequest;
      final user = await ActiveUserUtil.userInfo;
      await _addPatientUC.execute(request, user.id.toString());
      onSuccess?.call();
    } catch (e) {
      HandleNetworkError.handleNetworkError(e, (message, _, __) => onError?.call(message));
    }
  }

  void onInfoChange({
    String? mrn,
    String? patientName,
    String? date,
    int? genderIndex,
    int? raceIndex,
    String? phoneNumber,
    String? email,
    int? nationalityIndex,
    int? stateIndex,
    int? cityIndex,
    String? address,
    String? description
  }) {
    // update value for request only, not change view
    vm.value.update(
      mrn: mrn,
      patientName: patientName,
      date: date,
      genderIndex: genderIndex,
      raceIndex: raceIndex,
      phoneNumber: phoneNumber,
      email: email,
      nationalityIndex: nationalityIndex,
      stateIndex: stateIndex,
      cityIndex: cityIndex,
      address: address,
      description: description
    );
    vm.refresh();
  }
}