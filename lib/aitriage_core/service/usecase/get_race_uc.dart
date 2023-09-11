import 'package:flutter_aitriage/aitriage_core/service/entity/race.dart';
import '../service/local_storage_service/database/repository/isar_database_repository.dart';

class GetRaceUseCase {
  final _dbRepository = DatabaseRepository<Race>();
}