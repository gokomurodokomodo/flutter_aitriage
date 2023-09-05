import 'package:flutter_aitriage/aitriage_core/service/api_service/get_country/country.dart';
import '../../../network/common/base_response.dart';

class GetCountryResponse extends BaseResponse {
  final List<Country> data;

  GetCountryResponse.fromJson(dynamic json)
      : data = (json?['data'] as List).map((element) => Country.fromJson(element)).toList(),
        super.fromJson(json);
}