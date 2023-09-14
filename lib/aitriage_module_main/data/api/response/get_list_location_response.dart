import 'package:flutter_aitriage/aitriage_core/network/common/base_response.dart';
import 'package:flutter_aitriage/aitriage_module_main/domain/entity/location.dart';

class GetListLocationResponse extends BaseResponse {
  final data = <Location>[];

  GetListLocationResponse.fromJson(super.json) : super.fromJson();
}