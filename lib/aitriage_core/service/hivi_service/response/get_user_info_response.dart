import 'package:flutter_aitriage/aitriage_core/network/common/base_response.dart';
import '../../../entity/user_info.dart';

class GetUserInfoResponse extends BaseResponse {
  final UserInfo data;

  GetUserInfoResponse.fromJson(dynamic json)
      : data = UserInfo.fromJson(json?['data']),
        super.fromJson(json);
}