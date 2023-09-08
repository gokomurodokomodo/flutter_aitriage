import 'package:flutter_aitriage/aitriage_core/entity/city.dart';
import 'package:flutter_aitriage/aitriage_core/entity/country.dart';
import 'package:flutter_aitriage/aitriage_core/entity/param_type.dart';
import 'package:flutter_aitriage/aitriage_core/entity/race.dart';
import 'package:flutter_aitriage/aitriage_core/entity/role.dart';
import 'package:flutter_aitriage/aitriage_core/entity/state.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarProvider {
  IsarProvider._();

  static Isar? _isar;

  static Future init() async {
    final path = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [
        CitySchema,
        CountrySchema,
        ParamTypeSchema,
        RaceSchema,
        RoleSchema,
        StateSchema
      ],
      directory: path.path,
    );
  }

  static Isar get instance => _isar!;
}