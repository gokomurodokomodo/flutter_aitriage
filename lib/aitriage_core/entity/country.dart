import 'package:hive/hive.dart';
part 'country.g.dart';

@HiveType(typeId: 1)
class Country {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? iso3;
  @HiveField(3)
  final String? iso2;
  @HiveField(4)
  final String? numericCode;
  @HiveField(5)
  final String? phoneCode;
  @HiveField(6)
  final String? capital;
  @HiveField(7)
  final String? currency;
  @HiveField(8)
  final String? currencyName;
  @HiveField(9)
  final String? currencySymbol;
  @HiveField(10)
  final String? tld;
  @HiveField(11)
  final String? region;
  @HiveField(12)
  final String? subregion;
  @HiveField(13)
  final String? nationality;
  @HiveField(14)
  final String? timezones;
  @HiveField(15)
  final num? latitude;
  @HiveField(16)
  final num? longitude;
  @HiveField(17)
  final String? emoji;
  @HiveField(18)
  final String? emojiU;

  Country(
      this.id,
      this.name,
      this.iso3,
      this.iso2,
      this.numericCode,
      this.phoneCode,
      this.capital,
      this.currency,
      this.currencyName,
      this.currencySymbol,
      this.tld,
      this.region,
      this.subregion,
      this.nationality,
      this.timezones,
      this.latitude,
      this.longitude,
      this.emoji,
      this.emojiU);

  Country.fromJson(dynamic json)
      : id = json?['id'],
        name = json?['name'],
        iso3 = json?['iso3'],
        iso2 = json?['iso2'],
        numericCode = json?['numericCode'],
        phoneCode = json?['phoneCode'],
        capital = json?['capital'],
        currency = json?['currency'],
        currencyName = json?['currencyName'],
        currencySymbol = json?['currencySymbol'],
        tld = json?['tld'],
        region = json?['region'],
        subregion = json?['subregion'],
        nationality = json?['nationality'],
        timezones = json?['timezones'],
        latitude = json?['latitude'],
        longitude = json?['longitude'],
        emoji = json?['emoji'],
        emojiU = json?['emojiU'];
}
