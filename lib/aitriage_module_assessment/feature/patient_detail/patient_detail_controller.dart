import 'package:flutter_aitriage/aitriage_core/network/handle_error/handle_error.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/hivi_service.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_patient_detail_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/update_patient_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/patient_detail/patient_detail_vm.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/util/active_user/active_user.dart';
import '../../domain/use_case/get_gender_type_param_uc.dart';

class PatientDetailController extends GetxController {
  final GetPatientDetailUseCase _getPatientDetailUC;
  final GetGenderParamTypeUseCase _getGenderParamTypeUC;
  final UpdatePatientUseCase _updatePatientUC;
  // Nested navigation doesn't support dynamic argument, need to get argument from onGenerateRoute
  final dynamic _argument;
  final vm = PatientDetailVM().obs;

  PatientDetailController(
      this._argument, 
      this._getPatientDetailUC, 
      this._getGenderParamTypeUC, 
      this._updatePatientUC
  );

  @override
  void onReady() {
    super.onReady();
    getUserDetailInfo();
  }

  void getUserDetailInfo() async {
    try {
      final patientId = _argument['patientId'];
      final genderParamTypes = _getGenderParamTypeUC.execute();
      final userInfo = await ActiveUserUtil.userInfo;
      final resp = await _getPatientDetailUC.execute(userInfo.accountId.toString(), patientId.toString());
      vm.value.update(patient: resp.data, genderParamType: genderParamTypes);
      vm.refresh();
    } catch (_) {}
  }

  void onTapAvatar({
   Function? onSuccess,
   Function(String)? onError
  }) async {
    try {
      final resp = await HiviService.instance.uploadImageUC.execute();
      final userInfo = await ActiveUserUtil.userInfo;
      final updatedPatientInfo = vm.value.patientEntity.copyWith(avatar: resp.data);
      final resp1 = await _updatePatientUC.execute(updatedPatientInfo, userInfo.accountId.toString());
      vm.value.update(patient: resp1.data);
      vm.refresh();
      onSuccess?.call();
    } catch (error) {
      HandleNetworkError.handleNetworkError(error, (message, _, __) => onError?.call(message));
    }
  }
}