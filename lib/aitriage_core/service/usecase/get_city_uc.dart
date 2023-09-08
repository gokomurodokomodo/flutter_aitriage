import 'package:flutter_aitriage/aitriage_core/service/entity/city.dart';
import 'package:flutter_aitriage/aitriage_core/service/service/local_storage_service/database/repository/isar_database_repository.dart';

class GetCityUseCase {
  final _dbRepository = DatabaseRepository<City>();

  execute() {
    //1. check local created at
    //2. check firebase created at
    //3. if firebase > local -> calling api and save to local
    //4. load local and return value for later use
  }
}