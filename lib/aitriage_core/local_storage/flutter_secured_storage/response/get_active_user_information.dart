import '../repository/get_active_user_data.dart';
import '../repository/set_active_user_data.dart';

enum ActiveUserInformation {accessToken, refreshToken}

extension ActiveUserInfomationX on ActiveUserInformation{
  Future<String> get data async{
    switch(this){
      case ActiveUserInformation.accessToken:
        return await GetActiveUserRepository().getUserAccessToken(accessTokenKey: ActiveUserInformation.accessToken.securedKey);

      case ActiveUserInformation.refreshToken:
      return '';

      default:
        return '';
    }
  }

  String get securedKey{
    switch(this){
      case ActiveUserInformation.accessToken:
        return 'ACCESS_TOKEN';
      case ActiveUserInformation.refreshToken:
        return "REFRESH_TOKEN";
    }
  }
}

extension ActiveUserInfomationY on ActiveUserInformation{
  Future<void> setSecuredData(String data) async {
    switch(this){
      case ActiveUserInformation.accessToken:
        await SetActiveUserRepository().setAccessToken(ActiveUserInformation.accessToken.securedKey, data);
      case ActiveUserInformation.refreshToken:
        await SetActiveUserRepository().setAccessToken(ActiveUserInformation.accessToken.securedKey, data);
    }
  }
}