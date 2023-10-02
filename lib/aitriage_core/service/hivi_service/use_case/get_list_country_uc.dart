
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/repository/get_list_country_language_repository.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/response/get_list_country_language_response.dart';

class GetListCountryUC{
  final _repository = GetListCountryLanguageRepository();

  Future<GetListCountryLanguageResponse> execute() async {
    return await _repository.getListCountryLanguage();
  }
}