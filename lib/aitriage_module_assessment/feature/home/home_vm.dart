import 'package:flutter_aitriage/aitriage_core/entity/assessment.dart';

import '../../../aitriage_core/entity/param_type.dart';

class HomeVM {
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
}