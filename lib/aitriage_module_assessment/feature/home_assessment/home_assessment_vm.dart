import 'package:flutter_aitriage/aitriage_core/entity/param_type.dart';
import '../../../aitriage_core/entity/patient.dart';
import '../../../aitriage_core/service/localization_service/localization_service.dart';
import '../../../aitriage_core/ui/widget/patient_summary_listview.dart';
import '../../../aitriage_core/util/language_string_from_json/language_string_from_json.dart';

class HomeAssessmentVM {
  final _listPatient = <Patient>[];
  final _genderParamType = <ParamType>[];
  var _totalMale = 0;
  var _totalFemale = 0;
  var _totalPage = 1;

  void update({
    List<Patient>? listPatient,
    List<ParamType>? genderParamType,
    int? totalMale,
    int? totalFemale,
    int? totalPage
  }) {
    _totalMale = totalMale ?? _totalMale;
    _totalFemale = totalFemale ?? _totalFemale;
    _totalPage = totalPage ?? _totalPage;

    if (listPatient != null) {
      _listPatient.clear();
      _listPatient.addAll(listPatient);
    }

    if (genderParamType != null) {
      _genderParamType.clear();
      _genderParamType.addAll(genderParamType);
    }
  }

  List<PatientSummaryVM> get listPatientSummaryVM {
    final getCode = LocalizationService.currentLanguage.locale.languageCode;

    return _listPatient.map((e) {
      final paramType = _genderParamType.firstWhere((element) => element.key == e.gender);
      final genderColumnValue = LanguageStringFromJson.extractString(paramType.value ?? '', getCode);

      return PatientSummaryVM(
          patient: e,
          genderColumnMediaUrl: paramType.mediaUrl ?? '',
          genderColumnValue: genderColumnValue
      );
    }).toList();
  }

  int get totalMale => _totalMale;

  int get totalFemale => _totalFemale;

  int get totalPatient => _totalMale + _totalFemale;

  int get totalPage => _totalPage;
}