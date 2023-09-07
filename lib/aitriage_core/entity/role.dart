import 'package:hive/hive.dart';
part 'role.g.dart';

@HiveType(typeId: 4)
class Role {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? type;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? moduleCode;
  @HiveField(4)
  final String? moduleName;
  @HiveField(5)
  final String? description;
  @HiveField(6)
  final int? isPublic;
  @HiveField(7)
  final int? accountId;
  @HiveField(8)
  final String? accountNo;

  Role(
      this.id,
      this.type,
      this.name,
      this.moduleCode,
      this.moduleName,
      this.description,
      this.isPublic,
      this.accountId,
      this.accountNo
  );
}