import 'package:flutter_aitriage/aitriage_module_assessment/domain/repository/patient_repository.dart';
import '../../data/api/response/get_list_note_response.dart';

abstract class GetListPatientNoteUseCase {
  Future<GetListNoteResponse> execute(String customerId, int page, int limit);
}

class GetListPatientNoteUseCaseImpl extends GetListPatientNoteUseCase {
  final PatientRepository _repository;

  GetListPatientNoteUseCaseImpl(this._repository);

  @override
  Future<GetListNoteResponse> execute(String customerId, int page, int limit) {
    return _repository.getListPatientNote(customerId, page, limit);
  }
}