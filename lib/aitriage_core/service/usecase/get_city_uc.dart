import 'package:flutter_aitriage/aitriage_core/service/entity/city.dart';
import 'package:flutter_aitriage/aitriage_core/service/service/local_storage_service/database/repository/isar_database_repository.dart';

class GetCityUseCase {
  final _dbRepository = DatabaseRepository<City>();
}