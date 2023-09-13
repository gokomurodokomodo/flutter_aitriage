import '../../../aitriage_core/service/localization_service/localization_service.dart';
import '../../../aitriage_core/util/language_string_from_json/language_string_from_json.dart';

class AddNewPatientVM {
  final _genders = <String>[];
  final _races = <String>[];

  void update({
    List<String>? genders,
    List<String>? races,
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
  }

  List<String> get genders => _genders.toList();
  List<String> get races => _races.toList();
}