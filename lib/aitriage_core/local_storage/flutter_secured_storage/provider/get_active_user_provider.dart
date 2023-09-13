import '../core/secured_box.dart';

class GetActiveProvider{
  final securedBox = SecuredBox();

  Future<String> getAccessToken({required String accessTokenKey}) async{
    final result = await securedBox.read(key: accessTokenKey);
    return result;
  }

}