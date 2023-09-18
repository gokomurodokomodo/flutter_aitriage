import '../repository/active_user_repository.dart';

enum ActiveUserInformation {accessToken, refreshToken, userInfo}

extension ActiveUserInfomationX on ActiveUserInformation{
  Future<dynamic> getData({String key = ''}) async{
    switch(this){
      case ActiveUserInformation.accessToken:
        return await ActiveUserRepository().getUserAccessToken(accessTokenKey: ActiveUserInformation.accessToken.securedKey);

      case ActiveUserInformation.refreshToken:
        return '';

      case ActiveUserInformation.userInfo:
        return await ActiveUserRepository().getUserInfo(userKey: key);

      default:
        return '';
    }
  }

  String get securedKey{
    switch(this){
      case ActiveUserInformation.userInfo:
        return '';
      case ActiveUserInformation.accessToken:
        return 'ACCESS_TOKEN';
      case ActiveUserInformation.refreshToken:
        return "REFRESH_TOKEN";
    }
  }
}

extension ActiveUserInfomationY on ActiveUserInformation{
  Future<void> setSecuredData({String key = '', required dynamic data}) async {
    switch(this){ 
      case ActiveUserInformation.userInfo:
        await ActiveUserRepository().setUserInfo(key, data);
      case ActiveUserInformation.accessToken:
        await ActiveUserRepository().setAccessToken(ActiveUserInformation.accessToken.securedKey, data);
      case ActiveUserInformation.refreshToken:
        await ActiveUserRepository().setAccessToken(ActiveUserInformation.accessToken.securedKey, data);
    }
  }
}