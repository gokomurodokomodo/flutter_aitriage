import 'package:flutter_aitriage/aitriage_core/service/database_table.dart';
import 'package:flutter_aitriage/aitriage_core/service/entity/country.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../../entity/param_type.dart';

final _listAdapter = <TypeAdapter>[
  ParamTypeAdapter(),
  CountryAdapter()
];

class HiveProvider {
  HiveProvider._();

  static Future<void> init() async {
    final path = await getApplicationDocumentsDirectory();
    Hive.init(path.path);

    for (var table in DatabaseTable.values) {
      Hive.registerAdapter(table.typeAdapter);
    }
  }

  static read() {

  }

  static write() {

  }
}