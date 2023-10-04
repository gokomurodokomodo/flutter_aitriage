import 'package:flutter_aitriage/aitriage_module_assessment/domain/repository/patient_repository.dart';
import '../../../aitriage_core/network/common/base_response.dart';

abstract class EditNoteUseCase {
  Future<BaseResponse> execute(String noteId, String description);
}

class EditNoteUseCaseImpl extends EditNoteUseCase {
  final PatientRepository _repository;

  EditNoteUseCaseImpl(this._repository);

  @override
  Future<BaseResponse> execute(String noteId, String description) {
    return _repository.editNote(noteId, description);
  }
}
