class ListCountryLanguage {
  int? id;
  String? name;
  String? iso3;
  String? iso2;
  String? numericCode;
  String? phoneCode;
  String? capital;
  String? currency;
  String? currencyName;
  String? currencySymbol;
  String? tld;
  String? region;
  String? subregion;
  String? nationality;
  String? timezones;
  String? emoji;
  String? emojiU;

  ListCountryLanguage(
      {this.id,
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
      this.emoji,
      this.emojiU});

  ListCountryLanguage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iso3 = json['iso3'];
    iso2 = json['iso2'];
    numericCode = json['numericCode'];
    phoneCode = json['phoneCode'];
    capital = json['capital'];
    currency = json['currency'];
    currencyName = json['currencyName'];
    currencySymbol = json['currencySymbol'];
    tld = json['tld'];
    region = json['region'];
    subregion = json['subregion'];
    nationality = json['nationality'];
    timezones = json['timezones'];
    emoji = json['emoji'];
    emojiU = json['emojiU'];
  }
}