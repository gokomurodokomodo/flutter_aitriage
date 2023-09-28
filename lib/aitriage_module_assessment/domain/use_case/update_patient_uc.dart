import 'package:flutter_aitriage/aitriage_core/entity/patient.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/repository/patient_repository.dart';
import '../../../aitriage_core/network/common/base_response.dart';
import '../../data/api/response/patient_detail_response.dart';

abstract class UpdatePatientUseCase {
  Future<PatientDetailResponse> execute(Patient patient, String accountId);
}

class UpdatePatientUseCaseImpl extends UpdatePatientUseCase {
  final PatientRepository _repository;

  UpdatePatientUseCaseImpl(this._repository);

  @override
  Future<PatientDetailResponse> execute(Patient patient, String accountId) async {
    return await _repository.updatePatient(patient.copyWith(responseDetail: true), accountId);
  }
}
