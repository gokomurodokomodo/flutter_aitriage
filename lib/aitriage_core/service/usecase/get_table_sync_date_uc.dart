import '../entity/table_sync_date.dart';
import '../service/local_storage_service/database/repository/isar_database_repository.dart';

class GetTableSyncDateUseCase {
  final _provider = DatabaseRepository<TableSyncDate>();

  Future<TableSyncDate?> execute() async {
    final result = await _provider.readAll();

    if (result.isNotEmpty) return result.first;

    return null;
  }
}