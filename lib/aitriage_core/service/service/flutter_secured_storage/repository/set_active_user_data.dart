import 'package:flutter_aitriage/aitriage_core/service/service/flutter_secured_storage/provider/set_active_user_provider.dart';

class SetActiveUserRepository{
  final _provider = SetActiveUserProvider();

  Future<void> setAccessToken(String key, String data) async {
    _provider.setAccessToken(key, data);
  }
}