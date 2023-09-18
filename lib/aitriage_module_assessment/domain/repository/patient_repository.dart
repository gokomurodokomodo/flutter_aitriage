import 'package:flutter_aitriage/aitriage_core/service/hivi_service/response/get_list_country_language_response.dart';

abstract class PatientRepository {
  Future<GetListCountryLanguageResponse> getNationality();
}