import 'package:flutter_aitriage/aitriage_module_assessment/domain/repository/assessment_repository.dart';
import '../../data/api/query/list_assessment_by_patient_query.dart';
import '../../data/api/response/get_list_assessment_response.dart';

abstract class GetListAssessmentByPatientUseCase {
  Future<GetListAssessmentResponse> execute(int page, int limit, {String? patientId});
}

class GetListAssessmentByPatientUseCaseImpl extends GetListAssessmentByPatientUseCase {
  final AssessmentRepository _repository;

  GetListAssessmentByPatientUseCaseImpl(this._repository);

  @override
  Future<GetListAssessmentResponse> execute(int page, int limit, {String? patientId}) {
    final query = ListAssessmentByPatientQuery(page, limit, customerId: patientId);
    return _repository.getListAssessment(query);
  }
}