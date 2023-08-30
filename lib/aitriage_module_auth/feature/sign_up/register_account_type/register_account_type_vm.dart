import 'package:flutter_aitriage/aitriage_core/service/localization_service.dart';
import 'package:flutter_aitriage/aitriage_core/util/language_string_from_json/language_string_from_json.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/entity/register_account_param.dart';
import '../../../../aitriage_core/util/debounce/debounce_util.dart';

class RegisterAccountTypeVM {
  var _buttonSelectedIndex = -1;
  var _rowCount = 0;
  final debounce = DebounceUtil();
  final _list = <RegisterAccountParam>[];

  void updateVM({
    List<RegisterAccountParam>? list,
    int? buttonSelectedIndex
  }) {
    if (list != null) {
      _list.clear();
      _list.addAll(list);
      _list.sort((a, b) => (a.position ?? 0) - (b.position ?? 0));
      _rowCount = (_list.length / 3).ceil();
    }

    _buttonSelectedIndex = buttonSelectedIndex ?? _buttonSelectedIndex;
  }

  int get buttonSelectedIndex => _buttonSelectedIndex;

  int get rowCount => _rowCount;

  List<RegisterAccountParam> get listItem => _list;

  String itemTitle(int index) {
    if (!shouldShowThisItem(index)) return '';

    final item = _list[index];
    final jsonString = item.value ?? '';
    final getCode = LocalizationService.currentLanguage.locale.languageCode;
    final str = LanguageStringFromJson.extractString(jsonString, getCode);

    return str;
  }

  String itemImageUrl(int index) {
    if (!shouldShowThisItem(index)) return '';

    final item = _list[index];
    return item.mediaUrl ?? '';
  }

  bool isItemSelected(int index) => index == _buttonSelectedIndex;

  bool shouldShowThisItem(index) => index < _list.length;

  String get itemArgument {
    final item = _list[_buttonSelectedIndex];
    return item.key ?? '';
  }
}