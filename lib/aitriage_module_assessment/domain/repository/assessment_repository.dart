import 'package:flutter_aitriage/aitriage_core/network/common/base_query.dart';

abstract class AssessmentRepository {
  Future getListAssessment(BaseQuery query);
}