import 'package:flutter_aitriage/aitriage_core/network/common/base_response.dart';
import 'package:flutter_aitriage/aitriage_core/service/entity/country.dart';

class GetListCountryLanguageResponse extends BaseResponse {
  final data = <Country>[];

  GetListCountryLanguageResponse.fromJson(dynamic json) : super.fromJson(json) {
    final newList = (json?['data'] as List).map((e) => Country.fromJson(e)).toList();
    data.addAll(newList);
  }
}