import 'package:flutter_aitriage/aitriage_core/network/common/base_query.dart';
import '../../../aitriage_core/common/app_env.dart';
import '../../../aitriage_core/network/provider/get_base_provider.dart';
import '../../../aitriage_module_patient/config/patient_module_api_route.dart';
import '../../domain/repository/assessment_repository.dart';
import '../api/response/get_list_assessment_response.dart';

class AssessmentRepositoryImpl extends AssessmentRepository {
  final _provider = GetConnectBaseProvider(url: AppEnvironment.baseUrl);

  @override
  Future<GetListAssessmentResponse> getListAssessment(BaseQuery query) async {
    final resp = await _provider.get(PatientModuleApiRoute.getListAssessment, query: query.toQuery);
    return _provider.convertResponse(resp, (json) => GetListAssessmentResponse.fromJson(json));
  }
}