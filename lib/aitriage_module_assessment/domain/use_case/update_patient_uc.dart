import 'package:flutter_aitriage/aitriage_module_assessment/domain/repository/patient_repository.dart';
import '../../../aitriage_core/util/active_user/active_user.dart';
import '../../data/api/request/update_patient_request.dart';
import '../../data/api/response/patient_detail_response.dart';

abstract class UpdatePatientUseCase {
  Future<PatientDetailResponse> execute(UpdatePatientRequest request);
}

class UpdatePatientUseCaseImpl extends UpdatePatientUseCase {
  final PatientRepository _repository;

  UpdatePatientUseCaseImpl(this._repository);

  @override
  Future<PatientDetailResponse> execute(UpdatePatientRequest request) async {
    final user = await ActiveUserUtil.userInfo;
    return await _repository.updatePatient(request, user.accountId.toString());
  }
}
