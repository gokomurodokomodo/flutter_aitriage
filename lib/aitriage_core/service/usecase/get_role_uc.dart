import 'package:flutter_aitriage/aitriage_core/service/entity/role.dart';
import '../service/local_storage_service/database/repository/isar_database_repository.dart';

class GetRoleUseCase {
  final _dbRepository = DatabaseRepository<Role>();
}