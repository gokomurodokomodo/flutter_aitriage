import 'package:flutter_aitriage/aitriage_core/network/common/base_query.dart';

class DeleteNoteQuery extends BaseQuery {
  final String noteId;

  DeleteNoteQuery(this.noteId);

  @override
  Map<String, String> get toQuery => {
    'noteId': noteId
  };
}