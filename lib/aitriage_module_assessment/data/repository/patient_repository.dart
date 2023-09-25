import 'package:flutter_aitriage/aitriage_core/network/common/base_request.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/response/get_list_country_language_response.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/config/assessment_module_api_route.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/data/api/query/list_patient_query.dart';
import '../../../aitriage_core/common/app_env.dart';
import '../../../aitriage_core/network/common/base_response.dart';
import '../../../aitriage_core/network/provider/get_base_provider.dart';
import '../../domain/repository/patient_repository.dart';
import '../api/response/patient_response.dart';

class PatientRepositoryImpl extends PatientRepository {
  final _provider = GetConnectBaseProvider(url: AppEnvironment.baseUrl);

  @override
  Future<GetListCountryLanguageResponse> getNationality() async {
    final resp = await _provider.get(AssessmentModuleApiRoute.getNationality);
    return _provider.convertResponse(resp, (json) => GetListCountryLanguageResponse.fromJson(json));
  }

  @override
  Future<BaseResponse> addPatient(BaseRequest request, String accountId) async {
    final resp = await _provider.post(AssessmentModuleApiRoute.addPatient.replaceFirst('%s', accountId), request.toRequest());
    return _provider.convertResponse(resp, (json) => BaseResponse.fromJson(json));
  }

  @override
  Future<PatientResponse> getListPatient(String accountId, int page, int limit, {String? searchParam}) async {
    final query = ListPatientQuery(page, limit, 'ACTIVE', search: searchParam);
    final resp = await _provider.get(AssessmentModuleApiRoute.getAllPatient.replaceFirst('%s', accountId), query: query.toQuery);
    return _provider.convertResponse(resp, (json) => PatientResponse.fromJson(json));
  }
}