import 'package:flutter_aitriage/aitriage_core/network/common/base_response.dart';
import 'package:flutter_aitriage/aitriage_core/service/service/api_service/get_user_info/user_info.dart';

class GetUserInfoResponse extends BaseResponse {
  final UserInfo data;

  GetUserInfoResponse.fromJson(dynamic json)
      : data = UserInfo.fromJson(json?['data']),
        super.fromJson(json);
}