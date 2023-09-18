import 'package:flutter_aitriage/aitriage_module_assessment/data/api/request/add_patient_request.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/repository/patient_repository.dart';
import '../../../aitriage_core/network/common/base_response.dart';

abstract class AddPatientUseCase {
  Future<BaseResponse> execute(AddPatientRequest request, String accountId);
}

class AddPatientUseCaseImpl extends AddPatientUseCase {
  final PatientRepository _repository;

  AddPatientUseCaseImpl(this._repository);

  @override
  Future<BaseResponse> execute(AddPatientRequest request, String accountId) async {
    return await _repository.addPatient(request, accountId);
  }
}
