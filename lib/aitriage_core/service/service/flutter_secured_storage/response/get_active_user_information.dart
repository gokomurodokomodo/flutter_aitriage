import 'package:flutter_aitriage/aitriage_core/service/service/flutter_secured_storage/repository/get_active_user_data.dart';
import 'package:flutter_aitriage/aitriage_core/service/service/flutter_secured_storage/repository/set_active_user_data.dart';

enum ActiveUserInfomation {accessToken, refreshToken}

extension ActiveUserInfomationX on ActiveUserInfomation{
  Future<String> get data async{
    switch(this){
      case ActiveUserInfomation.accessToken:
        return await GetActiveUserRepository().getUserAccessToken(accessTokenKey: ActiveUserInfomation.accessToken.securedKey);

      case ActiveUserInfomation.refreshToken:
      return '';

      default:
        return '';
    }
  }

  String get securedKey{
    switch(this){
      case ActiveUserInfomation.accessToken:
        return 'ACCESS_TOKEN';
      case ActiveUserInfomation.refreshToken:
        return "REFRESH_TOKEN";
    }
  }
}

extension ActiveUserInfomationY on ActiveUserInfomation{
  Future<void> setSecuredData(String data) async {
    switch(this){
      case ActiveUserInfomation.accessToken:
        await SetActiveUserRepository().setAccessToken(ActiveUserInfomation.accessToken.securedKey, data);
      case ActiveUserInfomation.refreshToken:
        await SetActiveUserRepository().setAccessToken(ActiveUserInfomation.accessToken.securedKey, data);
    }
  }
}