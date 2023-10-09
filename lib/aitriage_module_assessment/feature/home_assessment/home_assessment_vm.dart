import 'package:flutter_aitriage/aitriage_core/entity/assessment.dart';
import '../../../aitriage_core/entity/param_type.dart';
import '../../../aitriage_core/service/localization_service/localization_service.dart';
import '../../../aitriage_core/util/language_string_from_json/language_string_from_json.dart';
import '../../widget/assessment_summary_list_view.dart';

class HomeAssessmentVM {
  final _listAssessment = <Assessment>[];
  final _genderParamType = <ParamType>[];
  var _totalLowRisk = 0;
  var _totalMediumRisk = 0;
  var _totalHighRisk = 0;
  var _totalPage = 1;
  var _currentPage = 0;
  var _pageLimit = 0;
  String? _searchParam;

  void update({
    List<Assessment>? listAssessment,
    List<ParamType>? genderParamType,
    int? totalLowRisk,
    int? totalMediumRisk,
    int? totalHighRisk,
    int? totalPage,
    int? currentPage,
    int? pageLimit,
    String? searchParam
  }) {
    _totalLowRisk = totalLowRisk ?? _totalLowRisk;
    _totalMediumRisk = totalMediumRisk ?? _totalMediumRisk;
    _totalHighRisk = totalHighRisk ?? _totalHighRisk;
    _totalPage = totalPage ?? _totalPage;
    _currentPage = currentPage ?? _currentPage;
    _pageLimit = pageLimit ?? _pageLimit;
    _searchParam = searchParam ?? _searchParam;

    if (listAssessment != null) {
      _listAssessment.clear();
      _listAssessment.addAll(listAssessment);
    }

    if (genderParamType != null) {
      _genderParamType.clear();
      _genderParamType.addAll(genderParamType);
    }
  }

  String? get searchParam => _searchParam;

  String get totalLowRisk => _totalLowRisk.toString();

  String get totalMediumRisk => _totalMediumRisk.toString();

  String get totalHighRisk => _totalHighRisk.toString();

  int get _totalAssessment => _totalLowRisk + _totalMediumRisk + _totalHighRisk;

  String get totalAssessment => _totalAssessment.toString();

  List<AssessmentSummaryVM> get listAssessmentVM {
    final getCode = LocalizationService.currentLanguage.locale.languageCode;

    return _listAssessment.map((e) {
      final paramType = _genderParamType.firstWhere((element) => element.key == e.gender);
      final genderColumnValue = LanguageStringFromJson.extractString(paramType.value ?? '', getCode);
      final id = (_currentPage) * _pageLimit + _listAssessment.indexOf(e) + 1;

      return AssessmentSummaryVM(
        id.toString(),
        e,
        paramType.mediaUrl ?? '',
        genderColumnValue
      );
    }).toList();
  }

  String get pageCountString => 'Show ${(_currentPage) * _pageLimit + 1} - ${_getCurrentAssessmentInPage(_currentPage + 1)}/$_totalAssessment';

  int _getCurrentAssessmentInPage(int page) {
    if (_totalAssessment - _pageLimit * page >= 0) {
      return 20 * page;
    } else {
      return _totalAssessment;
    }
  }

  int get totalPage => _totalPage == 0 ? 1 : _totalPage;
}