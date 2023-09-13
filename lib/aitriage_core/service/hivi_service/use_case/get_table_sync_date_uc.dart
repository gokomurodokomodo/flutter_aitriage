import '../../../entity/table_sync_date.dart';
import '../repository/isar_database_repository.dart';

class GetTableSyncDateUseCase {
  Future<TableSyncDate?> execute() async {
    final result = await DatabaseRepository.readAll<TableSyncDate>();

    if (result.isNotEmpty) return result.first;

    return null;
  }
}