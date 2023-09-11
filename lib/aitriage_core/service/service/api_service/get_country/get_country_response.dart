import '../../../../network/common/base_response.dart';
import '../../../entity/country.dart';

class GetCountryResponse extends BaseResponse {
  final List<Country> data;

  GetCountryResponse.fromJson(dynamic json)
      : data = (json?['data'] as List).map((element) => Country.fromJson(element)).toList(),
        super.fromJson(json);
}