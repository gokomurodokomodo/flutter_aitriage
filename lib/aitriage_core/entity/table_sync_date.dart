import 'package:isar/isar.dart';
part 'table_sync_date.g.dart';

@collection
class TableSyncDate {
  Id? id;
  final int? city;
  final int? country;
  final int? paramType;
  final int? race;
  final int? role;
  final int? state;
  final int? systemParam;

  TableSyncDate(
      this.city,
      this.country,
      this.paramType,
      this.race,
      this.role,
      this.state,
      this.systemParam
  );

  TableSyncDate.setAll(int time)
      : city = time,
        country = time,
        paramType = time,
        race = time,
        role = time,
        state = time,
        systemParam = time;

  TableSyncDate.fromJson(dynamic json)
      : city = json?['cities'],
        country = json?['countries'],
        paramType = json?['param-types'],
        race = json?['races'],
        role = json?['roles'],
        state = json?['states'],
        systemParam = json?['system-params'];
}