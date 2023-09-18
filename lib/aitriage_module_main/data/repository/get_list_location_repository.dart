import 'package:flutter_aitriage/aitriage_core/common/app_env.dart';
import 'package:flutter_aitriage/aitriage_core/network/provider/get_base_provider.dart';
import 'package:flutter_aitriage/aitriage_module_main/config/main_module_api_route.dart';
import 'package:flutter_aitriage/aitriage_module_main/data/api/response/get_list_location_response.dart';
import 'package:flutter_aitriage/aitriage_module_main/domain/repository/get_list_location_repository.dart';

class GetListLocationRepositoryImpl extends GetListLocationRepository {
  final _provider = GetConnectBaseProvider(url: AppEnvironment.baseUrl);

  @override
  Future<GetListLocationResponse> getListLocation(String userId) async {
    final response = await _provider.get(MainModuleApiRoute.getListLocation.replaceFirst('%s', '2'));
    return _provider.convertResponse(response, (json) => GetListLocationResponse.fromJson(json));
  }
}