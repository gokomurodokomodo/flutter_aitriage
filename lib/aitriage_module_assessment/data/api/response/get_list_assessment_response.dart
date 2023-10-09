import 'package:flutter_aitriage/aitriage_core/entity/assessment.dart';
import '../../../../aitriage_core/network/common/base_response.dart';

class GetListAssessmentResponse extends BaseResponse{
  final data = <Assessment>[];
  var totalItem = 0;
  var totalPage = 0;
  var totalElement = 0;
  var totalLowRisk = 0;
  var totalMediumRisk = 0;
  var totalHighRisk = 0;

  GetListAssessmentResponse.fromJson(dynamic json) : super.fromJson(json) {
    final list = (json?['data']?['assessmentPage']?['content'] as List).map((e) => Assessment.fromJson(e)).toList();
    data.addAll(list);
    totalItem = json?['data']?['assessmentPage']?['totalElements'] ?? 0;
    totalPage = json?['data']?['assessmentPage']?['totalPages'] ?? 1;
    totalElement = json?['data']?['assessmentPage']?['totalElements'] ?? 0;
    totalLowRisk = json?['data']?['assessmentRiskCategory']?['low'] ?? 0;
    totalMediumRisk = json?['data']?['assessmentRiskCategory']?['medium'] ?? 0;
    totalHighRisk = json?['data']?['assessmentRiskCategory']?['high'] ?? 0;
  }
}