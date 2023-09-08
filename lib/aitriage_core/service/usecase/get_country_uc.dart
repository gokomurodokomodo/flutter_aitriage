import 'package:flutter_aitriage/aitriage_core/service/entity/country.dart';
import '../service/api_service/get_country/get_country_repository.dart';
import '../service/api_service/get_country/get_country_response.dart';
import '../service/local_storage_service/database/repository/isar_database_repository.dart';

class GetCountryUseCase {
  final _repository = GetCountryRepository();
  final _dbRepository = DatabaseRepository<Country>();

  Future<GetCountryResponse> execute() async {
    return await _repository.getCountry();
  }
}