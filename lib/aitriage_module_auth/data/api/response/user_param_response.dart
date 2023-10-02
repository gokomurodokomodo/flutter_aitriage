import 'package:flutter_aitriage/aitriage_core/network/common/base_response.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/entity/user_param.dart';

class UserParamResponse extends BaseResponse{
  late UserParam data;

  UserParamResponse.fromJson(dynamic json) : super.fromJson(json){
    data = UserParam.fromJson(json?['data']);
  }
}