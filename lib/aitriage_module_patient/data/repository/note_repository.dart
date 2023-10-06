import '../../../aitriage_core/common/app_env.dart';
import '../../../aitriage_core/network/common/base_response.dart';
import '../../../aitriage_core/network/provider/get_base_provider.dart';
import '../../config/patient_module_api_route.dart';
import '../../domain/repository/note_repository.dart';
import '../api/query/delete_note_query.dart';
import '../api/query/list_patient_note_query.dart';
import '../api/request/add_patient_note_request.dart';
import '../api/request/edit_note_request.dart';
import '../api/response/get_list_note_response.dart';

class NoteRepositoryImpl extends NoteRepository {
  final _provider = GetConnectBaseProvider(url: AppEnvironment.baseUrl);

  @override
  Future<GetListNoteResponse> getListPatientNote(String customerId, int page, int limit) async {
    final query = ListPatientNoteQuery(page, limit, customerId: customerId);
    final resp = await _provider.get(PatientModuleApiRoute.getListPatientNote, query: query.toQuery);
    return _provider.convertResponse(resp, (json) => GetListNoteResponse.fromJson(json));
  }

  @override
  Future<BaseResponse> addNewPatientNote(String customerId, String description) async {
    final request = AddPatientNoteRequest(customerId, description);
    final resp = await _provider.post(PatientModuleApiRoute.addPatientNote, request.toRequest());
    return _provider.convertResponse(resp, (json) => BaseResponse.fromJson(json));
  }

  @override
  Future<BaseResponse> deleteNote(String noteId) async {
    final query = DeleteNoteQuery(noteId);
    final resp = await _provider.delete(PatientModuleApiRoute.deleteNote, query: query.toQuery);
    return _provider.convertResponse(resp, (json) => BaseResponse.fromJson(json));
  }

  @override
  Future<BaseResponse> editNote(String noteId, String description) async {
    final request = EditNoteRequest(noteId, description);
    final resp = await _provider.put(PatientModuleApiRoute.editNote, request.toRequest());
    return _provider.convertResponse(resp, (json) => BaseResponse.fromJson(json));
  }
}
