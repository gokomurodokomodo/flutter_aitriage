import 'package:isar/isar.dart';
part 'country.g.dart';

@collection
class Country {
  Id? isarId;
  final int? id;
  final String? name;
  final String? iso3;
  final String? iso2;
  final String? numericCode;
  final String? phoneCode;
  final String? capital;
  final String? currency;
  final String? currencyName;
  final String? currencySymbol;
  final String? tld;
  final String? region;
  final String? subregion;
  final String? nationality;
  final String? timezones;
  final double? latitude;
  final double? longitude;
  final String? emoji;
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
