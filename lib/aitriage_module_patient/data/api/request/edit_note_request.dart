import 'package:flutter_aitriage/aitriage_core/network/common/base_request.dart';

class EditNoteRequest extends BaseRequest {
  final String noteId;
  final String description;

  EditNoteRequest(this.noteId, this.description);

  @override
  Map<String, dynamic> toRequest() => {
    'id': noteId,
    'description': description
  };
}