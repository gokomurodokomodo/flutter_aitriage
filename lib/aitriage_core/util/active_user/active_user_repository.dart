import 'dart:convert';
import 'package:flutter_aitriage/aitriage_core/entity/user_info.dart';
import '../../local_storage/flutter_secured_storage/provider/secured_box.dart';

class ActiveUserRepository{
  final securedBox = SecuredBox();

  ActiveUserRepository();

  Future<String> getUserAccessToken({required String accessTokenKey}) async {
    final result = await securedBox.read(key: accessTokenKey);
    return result;
  }

  Future<void> setAccessToken(String key, String data) async {
    await securedBox.write(key: key, data: data);
  }

  Future<UserInfo> getUserInfo({required String userKey}) async{
    final rawData = await securedBox.read(key: userKey);
    final decodeJson = await jsonDecode(rawData);
    final result = UserInfo.fromJson(decodeJson);
    return result;
  }

  Future<void> setUserInfo(String key, UserInfo data) async{
    final jsonData = data.toJson();
    final encodeJson = jsonEncode(jsonData);
    await securedBox.write(key: key,data: encodeJson);
  }
}