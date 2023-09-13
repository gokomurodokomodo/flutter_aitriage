import '../repository/isar_database_repository.dart';

class SaveCollectionUseCase {
  execute<T>({T? object, List<T>? list}) async {
    await DatabaseRepository.write<T>(object: object, list: list);
  }
}