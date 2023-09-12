import 'package:isar/isar.dart';
import '../provider/isar_provider.dart';

class DatabaseRepository {
  DatabaseRepository._();

  /// Get a single object by its id or null if the object does not exist
  static Future<T?> readById<T>(int id) async {
    final db = IsarProvider.instance.collection<T>();
    return await db.get(id);
  }

  /// Get a list of objects by their ids or null if an object does not exist.
  static Future<List<T?>> readByMultipleId<T>(List<int> listId) async {
    final db = IsarProvider.instance.collection<T>();
    return await db.getAll(listId);
  }

  /// Find all objects.
  static Future<List<T>> readAll<T>() async {
    final db = IsarProvider.instance.collection<T>();
    return await db.where().findAll();
  }


  static Future write<T>({T? object, List<T>? list}) async {
    final db = IsarProvider.instance.collection<T>();
    return IsarProvider.instance.writeTxn(() async {
      if (object != null) await db.put(object);

      if (list != null) {
        for (var item in list) {
          await db.put(item);
        }
      }
    });
  }

  /// Delete a single object by its id.
  /// Returns whether the object has been deleted
  static Future<bool> deleteById<T>(int id) async {
    final db = IsarProvider.instance.collection<T>();
    return await db.delete(id);
  }

  /// Delete all objects. Returns the number of deleted objects
  static Future<int> deleteAll<T>() async {
    final db = IsarProvider.instance.collection<T>();
    return await IsarProvider.instance.writeTxn(() async => await db.where().deleteAll());
  }
}