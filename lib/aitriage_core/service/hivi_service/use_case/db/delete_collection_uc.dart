import '../../repository/isar_database_repository.dart';

class DeleteCollectionUseCase {
  execute<T>() async {
    await DatabaseRepository.deleteAll<T>();
  }
}