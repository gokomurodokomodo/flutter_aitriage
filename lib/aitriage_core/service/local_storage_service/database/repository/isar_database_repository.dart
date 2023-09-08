import 'package:isar/isar.dart';
import '../provider/isar_provider.dart';

class DatabaseRepository<T> {
  final _db = IsarProvider.instance.collection<T>();

  Future<T?> readById(int id) async {
    return await _db.get(id);
  }

  Future<List<T?>> readByMultipleId(List<int> listId) async {
    return await _db.getAll(listId);
  }

  Future<List<T>> readAll() async {
    return await _db.where().findAll();
  }

  Future<int> write(T object) async {
    return IsarProvider.instance.writeTxn(() async => await _db.put(object));
  }

  Future<bool> deleteById(int id) async {
    return await _db.delete(id);
  }

  Future<int> deleteAll() async {
    return await IsarProvider.instance.writeTxn(() async => await _db.where().deleteAll());
  }
}