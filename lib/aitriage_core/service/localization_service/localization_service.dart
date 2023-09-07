import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

enum LanguageType { vietnamese, english }

extension LanguageTypeX on LanguageType {
  Locale get locale {
    switch (this) {
      case LanguageType.vietnamese:
        return const Locale('vi', 'VN');
      case LanguageType.english:
        return const Locale('en', 'US');
    }
  }

  static LanguageType fromLanguage(String code) {
    switch (code) {
      case 'vi':
        return LanguageType.vietnamese;
      default:
        return LanguageType.english;
    }
  }
}

class LocalizationService extends Translations {
  static final Map<String, Map<String, String>> _currentKeys = {};
  static const fallbackLocale = Locale('en', 'US');
  static Locale get currentLocale => const Locale('en', 'US');
  static LanguageType get currentLanguage {
    final current = Get.locale?.languageCode ?? 'en';
    return LanguageTypeX.fromLanguage(current);
  }

  @override
  Map<String, Map<String, String>> get keys => _currentKeys;

  static Future<void> loadLanguage() async {
    const viFilePath = './lib/aitriage_core/asset/language/vi_VN.json';
    const enFilePath = './lib/aitriage_core/asset/language/en_US.json';
    _currentKeys['vi_VN'] = await _parseJsonFromAssets(viFilePath);
    _currentKeys['en_US'] = await _parseJsonFromAssets(enFilePath);
  }

  static void changeLocale(LanguageType languageEnum) => Get.updateLocale(languageEnum.locale);

  static Future<Map<String, String>> _parseJsonFromAssets(String assetsPath) async {
    final String dataString = await rootBundle.loadString(assetsPath);
    final Map<String, dynamic> jsonResult = jsonDecode(dataString);
    final Map<String, String> data = jsonResult.map((key, value) => MapEntry(key, value.toString()));

    return data;
  }
}