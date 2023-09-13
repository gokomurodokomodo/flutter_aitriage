import '../../../common/app_env.dart';
import '../../../network/provider/get_base_provider.dart';
import '../config/hivi_service_route.dart';
import '../response/get_role_response.dart';
import '../response/get_user_info_response.dart';

class GetUserInfoRepository {
  final _provider = GetConnectBaseProvider(url: AppEnvironment.baseUrl);

  Future<GetUserInfoResponse> getUserInfo(int id) async {
    final resp = await _provider.get(HiviServiceRoute.getUserInfo.replaceFirst('%s', id.toString()));
    return _provider.convertResponse(resp, (json) => GetUserInfoResponse.fromJson(json));
  }

  Future<GetRoleResponse> getRole() async {
    final resp = await _provider.get(HiviServiceRoute.getRole);
    return _provider.convertResponse(resp, (json) => GetRoleResponse.fromJson(json));
  }
}