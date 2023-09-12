import '../provider/get_active_user_provider.dart';

class GetActiveUserRepository{
  final _provider = GetActiveProvider();

  GetActiveUserRepository();

  Future<String> getUserAccessToken({required String accessTokenKey}) async {
    return await _provider.getAccessToken(accessTokenKey: accessTokenKey);
  }
}