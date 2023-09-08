import 'package:isar/isar.dart';
part 'role.g.dart';

@collection
class Role {
  Id? isarId;
  final int? id;
  final String? type;
  final String? name;
  final String? moduleCode;
  final String? moduleName;
  final String? description;
  final int? isPublic;
  final int? accountId;
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