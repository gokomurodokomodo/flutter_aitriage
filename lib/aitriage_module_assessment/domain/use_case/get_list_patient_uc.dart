import 'package:flutter_aitriage/aitriage_module_assessment/domain/repository/patient_repository.dart';
import '../../data/api/response/patient_response.dart';

abstract class GetListPatientUseCase {
  Future<PatientResponse> execute(String accountId, int page, int limit, {String? searchParam});
}

class GetListPatientUseCaseImpl extends GetListPatientUseCase {
  final PatientRepository _repository;

  GetListPatientUseCaseImpl(this._repository);

  @override
  Future<PatientResponse> execute(String accountId, int page, int limit, {String? searchParam}) async {
    final resp = await _repository.getListPatient(accountId, page, limit, searchParam: searchParam);
    return resp;
  }
}