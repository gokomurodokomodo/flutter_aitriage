import '../provider/set_active_user_provider.dart';

class SetActiveUserRepository{
  final _provider = SetActiveUserProvider();

  Future<void> setAccessToken(String key, String data) async {
    _provider.setAccessToken(key, data);
  }
}