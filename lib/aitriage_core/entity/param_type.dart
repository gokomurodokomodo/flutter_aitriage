import 'package:isar/isar.dart';
part 'param_type.g.dart';

@collection
class ParamType {
  Id? isarId;
  final String? groupType;
  final String? type;
  final String? key;
  final String? value;
  final String? description;
  final String? mediaUrl;
  final int? position;
  final String? scope;

  ParamType(
      this.groupType,
      this.type,
      this.key,
      this.value,
      this.description,
      this.mediaUrl,
      this.position,
      this.scope
  );

  ParamType.fromJson(dynamic json)
      : groupType = json?['groupType'],
        type = json?['type'],
        key = json?['key'],
        value = json?['value'],
        description = json?['description'],
        mediaUrl = json?['mediaUrl'],
        position = json?['position'],
        scope = json?['scope'];
}