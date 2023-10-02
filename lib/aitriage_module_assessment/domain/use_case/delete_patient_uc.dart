import 'package:flutter_aitriage/aitriage_module_assessment/domain/repository/patient_repository.dart';

import '../../../aitriage_core/network/common/base_response.dart';

abstract class DeletePatientUseCase {
  Future<BaseResponse> execute(String accountId, String patientId);
}

class DeletePatientUseCaseImpl extends DeletePatientUseCase {
  final PatientRepository _repository;

  DeletePatientUseCaseImpl(this._repository);

  @override
  Future<BaseResponse> execute(String accountId, String patientId) async {
    return await _repository.deletePatient(accountId, patientId);
  }
}