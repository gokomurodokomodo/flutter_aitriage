import 'package:flutter_aitriage/aitriage_core/entity/assessment.dart';
import '../../../../aitriage_core/network/common/base_response.dart';

class GetListAssessmentResponse extends BaseResponse{
  final data = <Assessment>[];
  var totalItem = 0;
  var totalPage = 0;
  var totalElement = 0;

  GetListAssessmentResponse.fromJson(dynamic json) : super.fromJson(json) {
    final list = (json?['data']?['assessmentPage']?['content'] as List).map((e) => Assessment.fromJson(e)).toList();
    data.addAll(list);
    totalItem = json?['data']?['assessmentPage']?['totalElements'] ?? 0;
    totalPage = json?['data']?['assessmentPage']?['totalPages'] ?? 1;
    totalElement = json?['data']?['assessmentPage']?['totalElements'] ?? 0;
  }
}