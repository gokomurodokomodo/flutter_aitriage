import 'package:flutter_aitriage/aitriage_core/common/app_env.dart';
import 'package:flutter_aitriage/aitriage_core/network/provider/get_base_provider.dart';
import 'package:flutter_aitriage/aitriage_core/service/service/api_service/api_service_route.dart';
import 'package:flutter_aitriage/aitriage_core/service/service/api_service/response/get_list_country_language_response.dart';

class GetListCountryLanguageRepository{
  final _provider = GetConnectBaseProvider(url: AppEnvironment.baseUrl);

  Future<GetListCountryLanguageResponse> getListCountryLanguage() async{
    final resp = await _provider.get(ApiServiceRoute.getListCountry);
    return _provider.convertResponse(resp, (json) => GetListCountryLanguageResponse.fromJson(json));
  }
}