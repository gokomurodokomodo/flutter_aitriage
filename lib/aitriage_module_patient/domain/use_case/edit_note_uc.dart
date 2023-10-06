import '../../../aitriage_core/network/common/base_response.dart';
import '../repository/note_repository.dart';

abstract class EditNoteUseCase {
  Future<BaseResponse> execute(String noteId, String description);
}

class EditNoteUseCaseImpl extends EditNoteUseCase {
  final NoteRepository _repository;

  EditNoteUseCaseImpl(this._repository);

  @override
  Future<BaseResponse> execute(String noteId, String description) {
    return _repository.editNote(noteId, description);
  }
}
