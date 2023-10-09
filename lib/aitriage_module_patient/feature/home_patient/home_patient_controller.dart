import 'dart:developer';
import 'package:flutter_aitriage/aitriage_core/common/app_constant.dart';
import 'package:flutter_aitriage/aitriage_core/util/debounce/debounce_util.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/network/handle_error/handle_error.dart';
import '../../domain/use_case/get_gender_type_param_uc.dart';
import '../../domain/use_case/get_list_patient_uc.dart';
import 'home_patient_vm.dart';

class HomePatientController extends GetxController {
  final GetListPatientUseCase _getListPatientUC;
  final GetGenderParamTypeUseCase _getGenderParamTypeUC;
  final vm = HomePatientVM().obs;
  final _debounce = DebounceUtil();

  HomePatientController(this._getListPatientUC, this._getGenderParamTypeUC);

  @override
  void onInit() async {
    super.onInit();
    onTapNumberPaginator(0);
  }
  void reloadCurrentPage() {
    final currentPage = vm.value.currentPage;
    onTapNumberPaginator(currentPage);
  }

  void onTapNumberPaginator(
      int page, {
        Function? onSuccess,
        Function(String)? onError
  }) async {
    try {
      final pageParam = page + 1;
      final genderParamType = _getGenderParamTypeUC.execute();
      final searchParam = vm.value.searchParam;
      final resp = await _getListPatientUC.execute(
          pageParam,
          AppConstant.pageLimit,
          searchParam: searchParam);
      final listPatient = resp.patient;
      vm.value.update(
          listPatient: listPatient,
          genderParamType: genderParamType,
          totalMale: resp.totalMale,
          totalFemale: resp.totalFemale,
          totalPage: resp.totalPage,
          pageLimit: AppConstant.pageLimit,
          currentPage: page);
      vm.refresh();
      onSuccess?.call();
    } catch (error) {
      log(error.toString());
      HandleNetworkError.handleNetworkError(
          error, (message, _, __) => onError?.call(message));
    }
  }

  void onSearchTextFieldChanged(
      String? text, {
        Function? onSuccess
  }) {
    // reset current page + pass text to api param
    vm.value.updateSearchParam(text);
    _debounce.run(() => onTapNumberPaginator(0, onSuccess: onSuccess));
  }
}
