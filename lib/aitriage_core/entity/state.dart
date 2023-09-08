import 'package:isar/isar.dart';
part 'state.g.dart';

@collection
class State {
  Id? isarId;
  final int? id;
  final String? name;
  final int? countryId;
  final String? countryCode;
  final String? countryName;
  final String? stateCode;
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