import '../../../common/app_env.dart';
import '../../../network/provider/get_base_provider.dart';
import '../api_service_route.dart';
import 'get_user_info_response.dart';

class GetUserInfoRepository {
  final _provider = GetConnectBaseProvider(url: AppEnvironment.baseUrl);

  Future<GetUserInfoResponse> getUserInfo(int id) async {
    final resp = await _provider.get(ApiServiceRoute.getUserInfo.replaceFirst('%s', id.toString()));
    return _provider.convertResponse(resp, (json) => GetUserInfoResponse.fromJson(json));
  }
}