import 'package:hive/hive.dart';
part 'race.g.dart';

@HiveType(typeId: 3)
class Race {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? code;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? dispStatus;

  Race(
      this.id,
      this.code,
      this.name,
      this.dispStatus
  );
}