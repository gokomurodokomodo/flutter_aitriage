import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_patient_detail_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/patient_detail/patient_detail_vm.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/util/active_user/active_user.dart';

class PatientDetailController extends GetxController {
  final GetPatientDetailUseCase _getPatientDetailUC;
  // Nested navigation doesn't support dynamic argument, need to get argument from onGenerateRoute
  final dynamic _argument;
  final vm = PatientDetailVM().obs;

  PatientDetailController(this._argument, this._getPatientDetailUC);

  @override
  void onReady() async {
    super.onReady();

    try {
      final patientId = _argument['patientId'];
      final userInfo = await ActiveUserUtil.userInfo;
      final resp = await _getPatientDetailUC.execute(userInfo.accountId.toString(), patientId.toString());
      vm.value.update(patient: resp.data);
      vm.refresh();
    } catch (e) {

    }
  }
}