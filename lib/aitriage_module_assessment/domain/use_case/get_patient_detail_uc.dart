import 'package:flutter_aitriage/aitriage_module_assessment/domain/repository/patient_repository.dart';

abstract class GetPatientDetailUseCase {
  Future execute(String accountId, String customerId);
}

class GetPatientDetailUseCaseImpl extends GetPatientDetailUseCase {
  final PatientRepository _repository;

  GetPatientDetailUseCaseImpl(this._repository);

  @override
  Future execute(String accountId, String customerId) async {
    return await _repository.getPatientDetail(accountId, customerId);
  }
}