import 'package:flutter_aitriage/aitriage_module_assessment/domain/repository/assessment_repository.dart';
import '../../data/api/query/list_assessment_by_patient_query.dart';

abstract class GetListAssessmentByPatientUseCase {
  Future execute(int page, int limit, {String? patientId});
}

class GetListAssessmentByPatientUseCaseImpl extends GetListAssessmentByPatientUseCase {
  final AssessmentRepository _repository;

  GetListAssessmentByPatientUseCaseImpl(this._repository);

  @override
  Future execute(int page, int limit, {String? patientId}) {
    final query = ListAssessmentByPatientQuery(page, limit, customerId: patientId);
    return _repository.getListAssessment(query);
  }
}