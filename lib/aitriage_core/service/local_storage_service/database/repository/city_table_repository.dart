import 'package:flutter_aitriage/aitriage_core/entity/city.dart';
import 'package:flutter_aitriage/aitriage_core/service/local_storage_service/database/provider/isar_provider.dart';
import 'package:isar/isar.dart';

class CityTableRepository {
  readByMultipleId(List<int> list) {
    final cities = IsarProvider.instance.citys.getAll(list);
    return cities;
  }

  readById(int id) async {
    final city = await IsarProvider.instance.citys.get(id);
    return city;
  }

  readAll() {
    final allCity = IsarProvider.instance.citys.where().findAll();
    return allCity;
  }

  deleteAll() async {
    await IsarProvider.instance.writeTxn(() async {
      await IsarProvider.instance.citys.where().deleteAll();
    });
  }

  deleteById(int id) {
    IsarProvider.instance.citys.delete(id);
  }

  write(City city) async {
    return IsarProvider.instance.writeTxn(() async {
      return await IsarProvider.instance.citys.put(city);
    });
  }
}