import '../core/secured_box.dart';

class SetActiveUserProvider {
  final securedBox = SecuredBox();
  
  void setAccessToken(String key, String token) async{
      await securedBox.write(key: key, data: token);
  }
}