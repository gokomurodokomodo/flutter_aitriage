import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_patient_detail_uc.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/util/active_user/active_user.dart';

class PatientDetailController extends GetxController {
  final GetPatientDetailUseCase _getPatientDetailUC;
  final dynamic _argument;

  PatientDetailController(this._argument, this._getPatientDetailUC);

  @override
  void onReady() async {
    super.onReady();
    final patientId = _argument['patientId'];
    final userInfo = await ActiveUserUtil.userInfo;
    _getPatientDetailUC.execute(userInfo.accountId.toString(), patientId.toString());
  }
}