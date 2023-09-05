import 'package:flutter_aitriage/aitriage_core/network/common/base_response.dart';
import '../../../domain/entity/user_email_verify_param.dart';

class UserVerifyEmailResponse extends BaseResponse{
  late UserEmailParam userEmail;
  UserVerifyEmailResponse.fromJson(dynamic json) : super.fromJson(json){
    userEmail = UserEmailParam.fromJson(json?['data']);
  }
}