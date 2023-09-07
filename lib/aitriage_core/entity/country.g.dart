// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountryAdapter extends TypeAdapter<Country> {
  @override
  final int typeId = 1;

  @override
  Country read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Country(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as String?,
      fields[8] as String?,
      fields[9] as String?,
      fields[10] as String?,
      fields[11] as String?,
      fields[12] as String?,
      fields[13] as String?,
      fields[14] as String?,
      fields[15] as num?,
      fields[16] as num?,
      fields[17] as String?,
      fields[18] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Country obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.iso3)
      ..writeByte(3)
      ..write(obj.iso2)
      ..writeByte(4)
      ..write(obj.numericCode)
      ..writeByte(5)
      ..write(obj.phoneCode)
      ..writeByte(6)
      ..write(obj.capital)
      ..writeByte(7)
      ..write(obj.currency)
      ..writeByte(8)
      ..write(obj.currencyName)
      ..writeByte(9)
      ..write(obj.currencySymbol)
      ..writeByte(10)
      ..write(obj.tld)
      ..writeByte(11)
      ..write(obj.region)
      ..writeByte(12)
      ..write(obj.subregion)
      ..writeByte(13)
      ..write(obj.nationality)
      ..writeByte(14)
      ..write(obj.timezones)
      ..writeByte(15)
      ..write(obj.latitude)
      ..writeByte(16)
      ..write(obj.longitude)
      ..writeByte(17)
      ..write(obj.emoji)
      ..writeByte(18)
      ..write(obj.emojiU);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
