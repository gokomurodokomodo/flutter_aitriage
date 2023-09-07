import 'package:flutter_aitriage/aitriage_core/service/api_service/get_param_type/param_type.dart';
import '../../../network/common/base_response.dart';

class GetParamTypeResponse extends BaseResponse {
  final data = <ParamType>[];

  GetParamTypeResponse.fromJson(dynamic json) : super.fromJson(json) {
    final newList = (json?['data'] as List).map((e) => ParamType.fromJson(e)).toList();
    data.addAll(newList);
  }
}