import 'package:flutter_aitriage/aitriage_core/entity/city.dart';

import '../../../aitriage_core/entity/state.dart';
import '../../../aitriage_core/service/localization_service/localization_service.dart';
import '../../../aitriage_core/util/language_string_from_json/language_string_from_json.dart';

class AddNewPatientVM {
  final _genders = <String>[];
  final _races = <String>[];
  final _nationalities = <String>[];
  final _cities = <String>[];
  final _states = <String>[];
  var _countryId = '0';

  void update({
    List<String>? genders,
    List<String>? races,
    List<String>? nationalities,
    List<String>? cities,
    List<String>? states,
    String? countryId
  }) {
    if (genders != null) {
      final getCode = LocalizationService.currentLanguage.locale.languageCode;
      final list = genders.map((e) => LanguageStringFromJson.extractString(e, getCode)).toList();
      _genders.clear();
      _genders.addAll(list);
    }

    if (races != null) {
      _races.clear();
      _races.addAll(races);
    }

    if (nationalities != null) {
      _nationalities.clear();
      _nationalities.addAll(nationalities);
    }

    if (cities != null) {
      _cities.clear();
      _cities.addAll(cities);
    }

    if (states != null) {
      _states.clear();
      _states.addAll(states);
    }

    _countryId = _countryId ?? _countryId;
  }

  List<String> get genders => _genders.toList();
  List<String> get races => _races.toList();
  List<String> get nationalities => _nationalities.toList();
  List<String> get cities => _cities.toList();
  List<String> get states => _states.toList();
  String get countryId => _countryId;
}