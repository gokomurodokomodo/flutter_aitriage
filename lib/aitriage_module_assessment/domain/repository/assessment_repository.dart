import 'package:flutter_aitriage/aitriage_core/network/common/base_query.dart';
import '../../data/api/response/get_list_assessment_response.dart';

abstract class AssessmentRepository {
  Future<GetListAssessmentResponse> getListAssessment(BaseQuery query);
}