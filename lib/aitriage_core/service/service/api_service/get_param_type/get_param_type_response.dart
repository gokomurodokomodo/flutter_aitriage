import '../../../../network/common/base_response.dart';
import '../../../entity/param_type.dart';

class GetParamTypeResponse extends BaseResponse {
  final data = <ParamType>[];

  GetParamTypeResponse.fromJson(dynamic json) : super.fromJson(json) {
    final newList = (json?['data'] as List).map((e) => ParamType.fromJson(e)).toList();
    data.addAll(newList);
  }
}