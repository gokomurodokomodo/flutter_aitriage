import 'package:flutter_aitriage/aitriage_core/entity/city.dart';
import 'package:flutter_aitriage/aitriage_core/service/local_storage_service/database/provider/isar_provider.dart';
import 'package:isar/isar.dart';

class CityTableRepository {
  final _cityDB = IsarProvider.instance.citys;

  Future<List<City?>> readByMultipleId(List<int> listId) {
    final cities = _cityDB.getAll(listId);
    return cities;
  }

  Future<City?> readById(int id) async {
    final city = await _cityDB.get(id);
    return city;
  }

  Future<List<City>> readAll() {
    final allCity = _cityDB.where().findAll();
    return allCity;
  }

  Future<int> deleteAll() async {
    return await IsarProvider.instance.writeTxn(() async {
      final result = await _cityDB.where().deleteAll();
      return result;
    });
  }

  Future<bool> deleteById(int id) async {
    return await _cityDB.delete(id);
  }

  Future<int> write(City city) async {
    return IsarProvider.instance.writeTxn(() async {
      return await _cityDB.put(city);
    });
  }
}