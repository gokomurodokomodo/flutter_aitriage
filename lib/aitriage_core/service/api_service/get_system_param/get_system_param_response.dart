import 'package:flutter_aitriage/aitriage_core/service/api_service/get_system_param/system_param.dart';
import '../../../network/common/base_response.dart';

class GetSystemParamResponse extends BaseResponse {
  final SystemParam data;

  GetSystemParamResponse.fromJson(dynamic json)
      : data = SystemParam.fromJson(json?['data']),
        super.fromJson(json);
}