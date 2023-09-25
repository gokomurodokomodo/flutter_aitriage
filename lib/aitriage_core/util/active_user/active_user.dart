import '../../entity/user_info.dart';
import 'active_user_repository.dart';

class ActiveUserUtil {
  static final _repository = ActiveUserRepository();
  static const _userInfoKey = 'USER_INFO';
  static const _accessTokenKey = 'ACCESS_TOKEN';
  // static const _refreshTokenKey = 'REFRESH_TOKEN';

  ActiveUserUtil._();

  static Future<String> get accessToken async {
    return await _repository.getUserAccessToken(accessTokenKey: _accessTokenKey);
  }

  static Future<UserInfo> get userInfo async {
    return await _repository.getUserInfo(userKey: _userInfoKey);
  }

  static Future<void> setAccessToken(String accessToken) async {
    await _repository.setAccessToken(_accessTokenKey, accessToken);
  }

  static Future<void> setUserInfo(UserInfo userInfo) async {
    await _repository.setUserInfo(_userInfoKey, userInfo);
  }

  static Future<void> userLogOut() async {
    await _repository.delete(_userInfoKey);
    await _repository.delete(_accessTokenKey);
  }
}

// enum ActiveUserUtil {accessToken, refreshToken, userInfo}
//
// extension ActiveUserX on ActiveUserUtil{
//   Future<dynamic> getData({String key = ''}) async{
//     switch(this){
//       case ActiveUserUtil.accessToken:
//         return await ActiveUserRepository().getUserAccessToken(accessTokenKey: ActiveUserUtil.accessToken.securedKey);
//
//       case ActiveUserUtil.refreshToken:
//         return '';
//
//       case ActiveUserUtil.userInfo:
//         return await ActiveUserRepository().getUserInfo(userKey: ActiveUserUtil.userInfo.securedKey);
//
//       default:
//         return '';
//     }
//   }
//
//   String get securedKey{
//     switch(this){
//       case ActiveUserUtil.userInfo:
//         return 'USER_INFO';
//       case ActiveUserUtil.accessToken:
//         return 'ACCESS_TOKEN';
//       case ActiveUserUtil.refreshToken:
//         return "REFRESH_TOKEN";
//     }
//   }
// }
//
// extension ActiveUserY on ActiveUserUtil{
//   Future<void> setSecuredData({String key = '', required dynamic data}) async {
//     switch(this){
//       case ActiveUserUtil.userInfo:
//         await ActiveUserRepository().setUserInfo(ActiveUserUtil.userInfo.securedKey, data);
//       case ActiveUserUtil.accessToken:
//         await ActiveUserRepository().setAccessToken(ActiveUserUtil.accessToken.securedKey, data);
//       case ActiveUserUtil.refreshToken:
//         await ActiveUserRepository().setAccessToken(ActiveUserUtil.accessToken.securedKey, data);
//     }
//   }
// }
