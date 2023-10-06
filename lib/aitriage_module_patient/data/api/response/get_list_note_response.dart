import '../../../../aitriage_core/entity/note.dart';
import '../../../../aitriage_core/network/common/base_response.dart';

class GetListNoteResponse extends BaseResponse{
  final data = <Note>[];
  var totalItem = 0;
  var totalPage = 0;
  var totalElement = 0;

  GetListNoteResponse.fromJson(dynamic json) : super.fromJson(json) {
    final list = (json?['data']?['content'] as List).map((e) => Note.fromJson(e)).toList();
    data.addAll(list);
    totalItem = json?['data']?['totalElements'] ?? 0;
    totalPage = json?['data']?['totalPages'] ?? 1;
    totalElement = json?['data']?['totalElements'] ?? 0;
  }
}