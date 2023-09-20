import 'package:flutter_aitriage/aitriage_core/util/active_user/active_user.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_gender_type_param_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_list_patient_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/home_assessment/home_assessment_vm.dart';
import 'package:get/get.dart';

class HomeAssessmentController extends GetxController {
  final GetListPatientUseCase _getListPatientUC;
  final GetGenderParamTypeUseCase _getGenderParamTypeUC;
  var totalPage = 10.obs;
  final vm = HomeAssessmentVM().obs;

  HomeAssessmentController(this._getListPatientUC, this._getGenderParamTypeUC);

  @override
  void onInit() async {
    super.onInit();
    onTapNumberPaginator(1);
  }

  void onTapNumberPaginator(int int) async {
    final genderParamType = _getGenderParamTypeUC.execute();
    final user = await ActiveUserUtil.userInfo;
    final resp = await _getListPatientUC.execute(user.id.toString(), int, 20);
    final listPatient = resp.patient;
    vm.value.update(
        listPatient: listPatient,
        genderParamType: genderParamType
    );
    vm.refresh();
  }
}