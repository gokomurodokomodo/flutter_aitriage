import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_gender_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/add_new_patient/add_new_patient_vm.dart';
import 'package:get/get.dart';
import '../../domain/use_case/get_race_uc.dart';

class AddNewPatientController extends GetxController {
  final GetGenderUseCase _getGenderUC;
  final GetRaceUseCase _getRaceUC;
  final vm = AddNewPatientVM().obs;

  AddNewPatientController(this._getGenderUC, this._getRaceUC);

  @override
  void onInit() {
    super.onInit();
    final genders = _getGenderUC.execute();
    final races = _getRaceUC.execute();
    vm.value.update(genders: genders, races: races);
    vm.refresh();
  }
}