import 'package:flutter_aitriage/aitriage_core/service/service/flutter_secured_storage/core/secured_box.dart';

class GetActiveProvider{
  final securedBox = SecuredBox();

  Future<String> getAccessToken({required String accessTokenKey}) async{
    final result = await securedBox.read(key: accessTokenKey);
    return result;
  }

}