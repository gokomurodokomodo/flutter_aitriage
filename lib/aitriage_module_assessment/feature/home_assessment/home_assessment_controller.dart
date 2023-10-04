import 'dart:developer';

import 'package:flutter_aitriage/aitriage_core/util/active_user/active_user.dart';
import 'package:flutter_aitriage/aitriage_core/util/debounce/debounce_util.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_gender_type_param_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_list_patient_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/home_assessment/home_assessment_vm.dart';
import 'package:get/get.dart';

import '../../../aitriage_core/network/handle_error/handle_error.dart';

class HomeAssessmentController extends GetxController {
  final GetListPatientUseCase _getListPatientUC;
  final GetGenderParamTypeUseCase _getGenderParamTypeUC;
  final vm = HomeAssessmentVM().obs;
  static const _pageLimit = 20;
  final _debounce = DebounceUtil();
  var showCountPatient = ''.obs;

  HomeAssessmentController(this._getListPatientUC, this._getGenderParamTypeUC);

  @override
  void onInit() async {
    super.onInit();
    onTapNumberPaginator(0);
    countPatient(1);
  }

  void countPatient(int page) {
    showCountPatient.value =
        'Show ${(page - 1) * _pageLimit + 1} - ${_getCurrentPatientInPage(page)}/${vm.value.totalPatient}';
  }

  int _getCurrentPatientInPage(int page) {
    if (vm.value.totalPatient - _pageLimit * page >= 0) {
      return 20 * page;
    } else {
      final result = vm.value.totalPatient;
      return result;
    }
  }

  void reloadCurrentPage() {
    final currentPage = vm.value.currentPage;
    onTapNumberPaginator(currentPage);
  }

  void onTapNumberPaginator(int page,
      {Function? onSuccess, Function(String)? onError}) async {
    try {
      final genderParamType = _getGenderParamTypeUC.execute();
      final user = await ActiveUserUtil.userInfo;
      final searchParam = vm.value.searchParam;
      final resp = await _getListPatientUC.execute(
          page + 1,
          _pageLimit,
          searchParam: searchParam);
      final listPatient = resp.patient;
      vm.value.update(
          listPatient: listPatient,
          genderParamType: genderParamType,
          totalMale: resp.totalMale,
          totalFemale: resp.totalFemale,
          totalPage: resp.totalPage,
          pageLimit: _pageLimit,
          currentPage: page);
      vm.refresh();
      countPatient(page + 1);
      onSuccess?.call();
    } catch (error) {
      log(error.toString());
      HandleNetworkError.handleNetworkError(
          error, (message, _, __) => onError?.call(message));
    }
  }

  void onSearchTextFieldChanged(String? text, {Function? onSuccess}) {
    // reset current page + pass text to api param
    vm.value.updateSearchParam(text);
    _debounce.run(() => onTapNumberPaginator(0, onSuccess: onSuccess),
        duration: const Duration(seconds: 2));
  }
}
