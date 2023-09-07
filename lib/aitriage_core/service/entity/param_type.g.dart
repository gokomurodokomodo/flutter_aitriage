// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'param_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ParamTypeAdapter extends TypeAdapter<ParamType> {
  @override
  final int typeId = 2;

  @override
  ParamType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ParamType(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as int?,
      fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ParamType obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.groupType)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.key)
      ..writeByte(3)
      ..write(obj.value)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.mediaUrl)
      ..writeByte(6)
      ..write(obj.position)
      ..writeByte(7)
      ..write(obj.scope);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParamTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
