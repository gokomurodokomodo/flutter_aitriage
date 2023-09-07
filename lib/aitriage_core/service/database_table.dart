import 'package:flutter_aitriage/aitriage_core/service/entity/city.dart';
import 'package:flutter_aitriage/aitriage_core/service/entity/race.dart';
import 'package:flutter_aitriage/aitriage_core/service/entity/state.dart';
import 'package:hive/hive.dart';
import 'entity/country.dart';
import 'entity/param_type.dart';
import 'entity/role.dart';

enum DatabaseTable { city, country, paramType, race, role, state }

extension DatabaseTableX on DatabaseTable {
  String get name {
    switch (this) {
      case DatabaseTable.city:
        return 'CITY';
      case DatabaseTable.country:
        return 'COUNTRY';
      case DatabaseTable.paramType:
        return 'PARAM_TYPE';
      case DatabaseTable.race:
        return 'RACE';
      case DatabaseTable.role:
        return 'ROLE';
      case DatabaseTable.state:
        return 'STATE';
    }
  }

  TypeAdapter get typeAdapter {
    switch (this) {
      case DatabaseTable.city:
        return CityAdapter();
      case DatabaseTable.country:
        return CountryAdapter();
      case DatabaseTable.paramType:
        return ParamTypeAdapter();
      case DatabaseTable.race:
        return RaceAdapter();
      case DatabaseTable.role:
        return RoleAdapter();
      case DatabaseTable.state:
        return StateAdapter();
    }
  }
}