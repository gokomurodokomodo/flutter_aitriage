import 'dart:convert';
import 'package:flutter_aitriage/aitriage_core/common/app_constant.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/entity/user_param.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorageService extends GetxService {
  LocalStorageService._();

  static final _instance = LocalStorageService._();

  factory LocalStorageService() => _instance;

  final GetStorage box = GetStorage();

  final FlutterSecureStorage securedBox = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ));

  void setCurrentAccessToken({
    required String accessToken
  }){
    securedBox.write(key: AppConstant.keyAccessToken, value: accessToken);
  }

  Future<String> getCurrentAccessToken() async{
    return await securedBox.read(key: AppConstant.keyAccessToken) ?? '';
  }

  ///[setSecuredUser] used for offline login with userName as key and password as value, this function call after success login.
  void setSecuredUser({
    required String userName,
    required String password
}) async{
    if(await securedBox.containsKey(key: userName)){
      if(await securedBox.read(key: userName) != password){
        securedBox.write(key: userName, value: password);
      }
    } else {
      securedBox.write(key: userName, value: password);
    }
  }

  ///[getSecuredUserPassword] return password for key is userName(Email) of user have been saved in local storage.
  Future<String> getSecuredUserPassword({
    required String userName
}) async{
    return await securedBox.read(key: userName) ?? 'USER_NOT_EXIST';
  }

  ///[setSecuredUserData] map userData to Json then encode it to String and save into SercuredBox with key is user's password.
  void setSecuredUserData({
    required String key,
    required UserParam data
  }) async {
    final json = data.toJson();
    final serializeJson = jsonEncode(json);
    securedBox.write(key: key, value: serializeJson);
  }

  ///[getUserData] return user's data from sercuredBox
  Future<UserParam> getUserData({
    required String key
  }) async {
    final rawData = await securedBox.read(key: key);
    final json = await jsonDecode(rawData ?? '');
    return UserParam.fromJson(json);
  }

  void setFirstDateOffline() async {
    if(await securedBox.containsKey(key: AppConstant.firstDateOffline)) {
      return;
    } else{
    securedBox.write(key: AppConstant.firstDateOffline, value: DateTime.now().toString());
    }
  }

  Future<DateTime> getFirstDateOffline() async {
    final firstDateOffline = await securedBox.read(key: AppConstant.firstDateOffline) ?? DateTime.now().toString();
    return DateTime.parse(firstDateOffline);
  }

  void set({dynamic value, required String forKey}) {
    box.write(forKey, value);
  }

  T get<T>({required String key, required T defaultValue}) {
    return cast<T>(box.read(key)) ?? defaultValue;
  }

  T? getOrNull<T>({required String key}) {
    return cast<T>(box.read(key));
  }

  void remove({required String key}) {
    box.remove(key);
  }

  void removeSecured({required String key}) {
    securedBox.delete(key: key);
  }

  T? cast<T>(dynamic value, {T? defaultValue}) => value is T ? value : defaultValue;

  //
  set updateFirstTimeOpening(bool value) => box.write(AppConstant.firstTimeOpening, value);

  bool get firstTimeOpening => box.read(AppConstant.firstTimeOpening);
}