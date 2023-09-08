import 'dart:convert';
import '../../../../../../aitriage_module_auth/domain/entity/user_param.dart';
import '../../../../../common/app_constant.dart';
import '../provider/get_storage_provider.dart';
import '../provider/secure_storage_provider.dart';

class UserLocalStorageRepository {
  final _securedStorageProvider = SecureStorageProvider();
  final _getStorageProvider = GetStorageProvider();

  Future setCurrentAccessToken({
    required String accessToken
  }) async {
    return await _securedStorageProvider.writeSecured(AppConstant.keyAccessToken, accessToken);
  }

  Future<String> getCurrentAccessToken() async{
    return await _securedStorageProvider.readSecured(AppConstant.keyAccessToken);
  }

  ///[setSecuredUser] used for offline login with userName as key and password as value, this function call after success login.
  Future setSecuredUser({
    required String userName,
    required String password
  }) async {
    await _securedStorageProvider.writeSecured(AppConstant.currentUserName, userName);
    await _securedStorageProvider.writeSecured(AppConstant.currentUserPassword, password);
  }

  ///[getSecuredUserPassword] return password for key is userName(Email)
  ///of user have been saved in local storage.
  Future<String> getSecuredUserPassword({
    required String userName
  }) async{
    return await _securedStorageProvider.readSecured(AppConstant.currentUserName);
  }

  ///[setSecuredUserData] map userData to Json then encode it to String
  ///and save into SercuredBox with key is user's password.
  Future setSecuredUserData({
    required String key,
    required UserParam data
  }) async {
    final json = data.toJson();
    final serializeJson = jsonEncode(json);
    return await _securedStorageProvider.writeSecured(key, serializeJson);
  }

  ///[getUserData] return user's data from sercuredBox
  Future<UserParam> getUserData({
    required String key
  }) async {
    final rawData = await _securedStorageProvider.readSecured(key);
    final json = await jsonDecode(rawData ?? '');
    return UserParam.fromJson(json);
  }

  // void setFirstDateOffline() async {
  //   if(await securedBox.containsKey(key: AppConstant.firstDateOffline)) {
  //     return;
  //   } else{
  //     securedBox.write(key: AppConstant.firstDateOffline, value: DateTime.now().toString());
  //   }
  // }

  // Future<DateTime> getFirstDateOffline() async {
  //   final firstDateOffline = await securedBox.read(key: AppConstant.firstDateOffline) ?? DateTime.now().toString();
  //   return DateTime.parse(firstDateOffline);
  // }

  // void set({dynamic value, required String forKey}) {
  //   getStorage.write(forKey, value);
  // }

  // T get<T>({required String key, required T defaultValue}) {
  //   return cast<T>(getStorage.read(key)) ?? defaultValue;
  // }

  // T? getOrNull<T>({required String key}) {
  //   return cast<T>(getStorage.read(key));
  // }
  //
  // void remove({required String key}) {
  //   getStorage.remove(key);
  // }
  //
  // void removeSecured({required String key}) {
  //   securedBox.delete(key: key);
  // }
  //
  // T? cast<T>(dynamic value, {T? defaultValue}) => value is T ? value : defaultValue;
  //
  // //
  // set updateFirstTimeOpening(bool value) => getStorage.write(AppConstant.firstTimeOpening, value);
  //
  // bool get firstTimeOpening => getStorage.read(AppConstant.firstTimeOpening);
}