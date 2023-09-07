import 'package:hive/hive.dart';
part 'state.g.dart';

@HiveType(typeId: 5)
class State {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final int? countryId;
  @HiveField(3)
  final String? countryCode;
  @HiveField(4)
  final String? countryName;
  @HiveField(5)
  final String? stateCode;
  @HiveField(6)
  final String? type;

  State(
      this.id,
      this.name,
      this.countryId,
      this.countryCode,
      this.countryName,
      this.stateCode,
      this.type
  );
}