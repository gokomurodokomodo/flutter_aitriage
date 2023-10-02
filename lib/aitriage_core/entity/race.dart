import 'package:isar/isar.dart';
part 'race.g.dart';

@collection
class Race {
  Id? isarId;
  final int? id;
  final String? code;
  final String? name;
  final String? dispStatus;

  Race(
      this.id,
      this.code,
      this.name,
      this.dispStatus
  );

  Race.fromJson(dynamic json)
      : id = json?['id'],
        code = json?['code'],
        name = json?['name'],
        dispStatus = json?['dispStatus'];
}