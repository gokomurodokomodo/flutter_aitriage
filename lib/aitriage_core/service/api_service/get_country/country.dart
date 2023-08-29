class Country {
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
  final num? latitude;
  final num? longitude;
  final String? emoji;
  final String? emojiU;

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
