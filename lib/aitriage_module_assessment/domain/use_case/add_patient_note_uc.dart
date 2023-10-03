import 'package:flutter_aitriage/aitriage_module_assessment/domain/repository/patient_repository.dart';

abstract class AddPatientNoteUseCase {
  Future execute(String customerId, String description);
}

class AddPatientNoteUseCaseImpl extends AddPatientNoteUseCase {
  final PatientRepository _repository;

  AddPatientNoteUseCaseImpl(this._repository);

  @override
  Future execute(String customerId, String description) {
    return _repository.addNewPatientNote(customerId, description);
  }

}