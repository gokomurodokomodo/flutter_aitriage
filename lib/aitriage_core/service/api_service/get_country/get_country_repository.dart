import 'package:flutter_aitriage/aitriage_core/common/app_env.dart';
import 'package:flutter_aitriage/aitriage_core/network/base_response.dart';
import 'package:flutter_aitriage/aitriage_core/network/provider/get_base_provider.dart';
import 'package:flutter_aitriage/aitriage_core/service/api_service/api_service_route.dart';

import 'get_country_response.dart';

class GetCountryRepository {
  final _provider = GetConnectBaseProvider(url: AppEnvironment.baseUrl);

  Future<GetCountryResponse> getCountry() async {
    final resp = await _provider.get(ApiServiceRoute.getCountry);
    return _provider.convertResponse(resp, (json) => GetCountryResponse.fromJson(json));
  }
}