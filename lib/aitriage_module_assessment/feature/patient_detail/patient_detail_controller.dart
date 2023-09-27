import 'dart:developer';

import 'package:flutter_aitriage/aitriage_core/service/hivi_service/hivi_service.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_patient_detail_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/patient_detail/patient_detail_vm.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/util/active_user/active_user.dart';
import '../../domain/use_case/get_gender_type_param_uc.dart';

class PatientDetailController extends GetxController {
  final GetPatientDetailUseCase _getPatientDetailUC;
  final GetGenderParamTypeUseCase _getGenderParamTypeUC;
  // Nested navigation doesn't support dynamic argument, need to get argument from onGenerateRoute
  final dynamic _argument;
  final vm = PatientDetailVM().obs;

  PatientDetailController(this._argument, this._getPatientDetailUC, this._getGenderParamTypeUC);

  @override
  void onReady() async {
    super.onReady();

    try {
      final patientId = _argument['patientId'];
      final genderParamTypes = _getGenderParamTypeUC.execute();
      final userInfo = await ActiveUserUtil.userInfo;
      final resp = await _getPatientDetailUC.execute(userInfo.accountId.toString(), patientId.toString());
      vm.value.update(patient: resp.data, genderParamType: genderParamTypes);
      vm.refresh();
    } catch (_) {}
  }

  void onTapAvatar() async {
    final hiviService = HiviService.instance;
    final resp = await hiviService.uploadImageUC.execute();
    log('url123 : ${resp.data}');
  }
}