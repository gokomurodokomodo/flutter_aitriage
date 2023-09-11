import 'package:flutter_aitriage/aitriage_core/service/entity/state.dart';
import '../service/local_storage_service/database/repository/isar_database_repository.dart';

class GetStateUseCase {
  final _dbRepository = DatabaseRepository<State>();
}