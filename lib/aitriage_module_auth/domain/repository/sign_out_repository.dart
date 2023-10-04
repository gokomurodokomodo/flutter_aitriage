import 'package:flutter_aitriage/aitriage_core/network/common/base_response.dart';

abstract class SignOutRepository {
  Future<BaseResponse> signOut(String userId, String accessToken);
}