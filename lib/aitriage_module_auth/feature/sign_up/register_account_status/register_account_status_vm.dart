import '../../../../aitriage_core/service/localization_service.dart';
import '../../../../aitriage_core/util/language_string_from_json/language_string_from_json.dart';
import '../../../domain/entity/register_account_param.dart';

class RegisterAccountStatusVM {
  var _buttonStatusIndex = -1;
  var _buttonYesNoIndex = -1;
  var _rowCount = 0;
  final _list = <RegisterAccountParam>[];

  void updateVM({
    List<RegisterAccountParam>? list,
    int? buttonStatusIndex,
    int? buttonYesNoIndex,
  }) {
    if (list != null) {
      _list.clear();
      _list.addAll(list);
      _list.sort((a, b) => (a.position ?? 0) - (b.position ?? 0));
      // +1 for the fixed business own row
      _rowCount = (_list.length / 3).ceil() + 1;
    }

    _buttonStatusIndex = buttonStatusIndex ?? _buttonStatusIndex;
    _buttonYesNoIndex = buttonYesNoIndex ?? _buttonYesNoIndex;
  }

  int get buttonSelectedIndex => _buttonStatusIndex;

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

  bool isStatusButtonSelected(int index) => index == _buttonStatusIndex;

  bool isYesNoButtonSelected(int index) => index == _buttonYesNoIndex;

  bool shouldShowThisItem(int index) => index < _list.length;

  bool isFirstView(int rowIndex) => rowIndex + 1 < rowCount;

  bool get shouldNavigateToNextScreen => _buttonStatusIndex != -1 && _buttonYesNoIndex != -1;

  String get statusArgument {
    final item = _list[_buttonStatusIndex];
    return item.key ?? '';
  }

  int get yesNoArgument => _buttonStatusIndex == 0 ? 1 : 0;
}