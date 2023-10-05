import '../../../aitriage_core/network/common/base_response.dart';
import '../../data/api/response/get_list_note_response.dart';

abstract class NoteRepository {
  Future<GetListNoteResponse> getListPatientNote(String customerId, int page, int limit);
  Future<BaseResponse> addNewPatientNote(String customerId, String description);
  Future<BaseResponse> deleteNote(String noteId);
  Future<BaseResponse> editNote(String noteId, String description);
}