import 'dart:convert';

class LanguageStringFromJson {
  LanguageStringFromJson._();

  static String extractString(String jsonString, String code) {
    final jsonData = jsonDecode(jsonString);
    return jsonData[code];
  }
}