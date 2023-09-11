import '../service/local_storage_service/database/repository/isar_database_repository.dart';

class SaveDatabaseDataUseCase<T> {
  final _repository = DatabaseRepository<T>();

  execute({T? object, List<T>? list}) async {
    await _repository.write(object: object, list: list);
  }
}