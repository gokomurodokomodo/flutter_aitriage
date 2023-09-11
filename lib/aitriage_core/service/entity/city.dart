import 'package:isar/isar.dart';
part 'city.g.dart';

@collection
class City {
  Id? isarId;
  final int? id;
  final String? name;
  final int? stateId;
  final String? stateCode;
  final String? stateName;
  final int? countryId;
  final String? countryCode;
  final String? countryName;

  City(
      this.isarId,
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