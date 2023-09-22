import 'package:flutter_aitriage/aitriage_core/util/active_user/active_user.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_gender_type_param_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_list_patient_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/home_assessment/home_assessment_vm.dart';
import 'package:get/get.dart';

class HomeAssessmentController extends GetxController {
  final GetListPatientUseCase _getListPatientUC;
  final GetGenderParamTypeUseCase _getGenderParamTypeUC;
  final vm = HomeAssessmentVM().obs;
  static const _pageLimit = 20;

  HomeAssessmentController(this._getListPatientUC, this._getGenderParamTypeUC);

  @override
  void onInit() async {
    super.onInit();
    onTapNumberPaginator(0);
  }

  void onTapNumberPaginator(int page) async {
    final genderParamType = _getGenderParamTypeUC.execute();
    final user = await ActiveUserUtil.userInfo;
    final resp = await _getListPatientUC.execute(user.id.toString(), page + 1, _pageLimit);
    final listPatient = resp.patient;
    vm.value.update(
        listPatient: listPatient,
        genderParamType: genderParamType,
        totalMale: resp.totalMale,
        totalFemale: resp.totalFemale,
        totalPage: resp.totalPage,
        pageLimit: _pageLimit,
        currentPage: page
    );
    vm.refresh();
  }
}