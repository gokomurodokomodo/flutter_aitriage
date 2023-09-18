import 'package:flutter_aitriage/aitriage_core/service/hivi_service/response/get_list_country_language_response.dart';
import '../../../aitriage_core/network/common/base_request.dart';
import '../../../aitriage_core/network/common/base_response.dart';

abstract class PatientRepository {
  Future<GetListCountryLanguageResponse> getNationality();
  Future<BaseResponse> addPatient(BaseRequest request, String accountId);
}