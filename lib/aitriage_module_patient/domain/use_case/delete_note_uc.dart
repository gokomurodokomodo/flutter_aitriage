import '../../../aitriage_core/network/common/base_response.dart';
import '../repository/note_repository.dart';

abstract class DeleteNoteUseCase {
  Future<BaseResponse> execute(String noteId);
}

class DeleteNoteUseCaseImpl extends DeleteNoteUseCase {
  final NoteRepository _repository;

  DeleteNoteUseCaseImpl(this._repository);

  @override
  Future<BaseResponse> execute(String noteId) {
    return _repository.deleteNote(noteId);
  }
}
