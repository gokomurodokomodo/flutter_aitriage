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
}