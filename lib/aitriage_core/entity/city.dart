import 'package:hive/hive.dart';
part 'city.g.dart';

@HiveType(typeId: 0)
class City {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final int? stateId;
  @HiveField(3)
  final String? stateCode;
  @HiveField(4)
  final String? stateName;
  @HiveField(5)
  final int? countryId;
  @HiveField(6)
  final String? countryCode;
  @HiveField(7)
  final String? countryName;

  City(
      this.id,
      this.name,
      this.stateId,
      this.stateCode,
      this.stateName,
      this.countryId,
      this.countryCode,
      this.countryName
  );
}