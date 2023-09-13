import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_gender_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_nationality_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/add_new_patient/add_new_patient_vm.dart';
import 'package:get/get.dart';
import '../../domain/use_case/get_race_uc.dart';

class AddNewPatientController extends GetxController {
  final GetGenderUseCase _getGenderUC;
  final GetRaceUseCase _getRaceUC;
  final GetNationalityUseCase _getNationalityUC;
  final vm = AddNewPatientVM().obs;

  AddNewPatientController(this._getGenderUC, this._getRaceUC, this._getNationalityUC);

  @override
  void onInit() async {
    super.onInit();
    final genders = _getGenderUC.execute();
    final races = _getRaceUC.execute();
    final nationalities = await _getNationalityUC.execute();
    vm.value.update(
        genders: genders,
        races: races,
        nationalities: nationalities
    );
    vm.refresh();
  }
}