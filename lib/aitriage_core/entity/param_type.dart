import 'package:hive/hive.dart';
part 'param_type.g.dart';

@HiveType(typeId: 2)
class ParamType {
  @HiveField(0)
  final String? groupType;
  @HiveField(1)
  final String? type;
  @HiveField(2)
  final String? key;
  @HiveField(3)
  final String? value;
  @HiveField(4)
  final String? description;
  @HiveField(5)
  final String? mediaUrl;
  @HiveField(6)
  final int? position;
  @HiveField(7)
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