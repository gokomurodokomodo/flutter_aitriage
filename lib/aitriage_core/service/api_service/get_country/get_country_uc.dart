import 'package:flutter_aitriage/aitriage_core/service/api_service/get_country/get_country_repository.dart';
import 'get_country_response.dart';

class GetCountryUseCase {
  final _repository = GetCountryRepository();

  Future<GetCountryResponse> execute() async {
    return await _repository.getCountry();
  }
}