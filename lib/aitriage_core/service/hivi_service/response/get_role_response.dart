import 'package:flutter_aitriage/aitriage_core/network/common/base_response.dart';
import '../../../entity/role.dart';

class GetRoleResponse extends BaseResponse {
  final data = <Role>[];

  GetRoleResponse.fromJson(dynamic json) : super.fromJson(json) {
    final list = (json?['data'] as List).map((e) => Role.fromJson(e));
    data.addAll(list);
  }
}