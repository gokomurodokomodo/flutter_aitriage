import 'package:flutter_aitriage/aitriage_core/network/common/base_response.dart';
import '../../../entity/race.dart';

class GetRaceResponse extends BaseResponse {
  final data = <Race>[];

  GetRaceResponse.fromJson(dynamic json) : super.fromJson(json) {
    final list = (json?['data'] as List).map((e) => Race.fromJson(e));
    data.addAll(list);
  }
}