import 'package:flutter_aitriage/aitriage_core/entity/assessment.dart';
import 'package:flutter_aitriage/aitriage_core/entity/note.dart';
import 'package:flutter_aitriage/aitriage_core/util/date_time_parse_util.dart';
import 'package:intl/intl.dart';
import '../../../aitriage_core/common/app_image.dart';
import '../../../aitriage_core/entity/param_type.dart';
import '../../../aitriage_core/entity/patient.dart';
import '../../../aitriage_core/service/localization_service/localization_service.dart';
import '../../../aitriage_core/util/language_string_from_json/language_string_from_json.dart';
import '../../widget/patient_detail_assessment.dart';
import '../../widget/patient_detail_note.dart';

class PatientDetailVM {
  var _patient = Patient();
  final _genderParamType = <ParamType>[];
  final _listNote = <Note>[];
  final _listAssessment = <Assessment>[];
  var _shouldReloadData = false;
  // Note view variable
  var _noteTotalPage = 1;
  var _noteCurrentPage = 0;
  var _notePageLimit = 0;
  var _noteTotalItem = 0;
  // Assessment view variable
  var _assessmentTotalPage = 1;
  var _assessmentCurrentPage = 0;
  var _assessmentPageLimit = 0;
  var _assessmentTotalItem = 0;

  void update({
    Patient? patient,
    List<ParamType>? genderParamType,
    bool? shouldReloadData,
    // Note
    List<Note>? listNote,
    int? noteTotalPage,
    int? noteCurrentPage,
    int? notePageLimit,
    int? noteTotalItem,
    // Assessment
    List<Assessment>? listAssessment,
    int? assessmentTotalPage,
    int? assessmentCurrentPage,
    int? assessmentPageLimit,
    int? assessmentTotalItem,
  }) {
    _patient = patient ?? _patient;
    _shouldReloadData = shouldReloadData ?? _shouldReloadData;
    _noteTotalPage = noteTotalPage ?? _noteTotalPage;
    _noteCurrentPage = noteCurrentPage ?? _noteCurrentPage;
    _notePageLimit = notePageLimit ?? _notePageLimit;
    _noteTotalItem = noteTotalItem ?? _noteTotalItem;

    _assessmentTotalPage = assessmentTotalPage ?? _assessmentTotalPage;
    _assessmentCurrentPage = assessmentCurrentPage ?? _assessmentCurrentPage;
    _assessmentPageLimit = assessmentPageLimit ?? _assessmentPageLimit;
    _assessmentTotalItem = assessmentTotalItem ?? _assessmentTotalItem;

    if (genderParamType != null) {
      _genderParamType.clear();
      _genderParamType.addAll(genderParamType);
    }

    if (listNote != null) {
      _listNote.clear();
      _listNote.addAll(listNote);
    }

    if (listAssessment != null) {
      _listAssessment.clear();
      _listAssessment.addAll(listAssessment);
    }
  }

  String get patientAvatar => _patient.avatar ?? '';

  String get patientErrorAvatar => switch (_patient.gender) {
    'MALE' => AppImage.icDefaultAvatarMale,
    'FEMALE' => AppImage.icDefaultAvatarFemale,
    _ => AppImage.icDefaultAvatarMale
  };

  String get patientFullName => _patient.fullName ?? '';

  String get patientRaceName => _patient.raceName ?? '';

  String get patientAge => '${_patient.age?.toString() ?? ''} ${_patient.age != null ? 'years old' : ''}';

  String get patientCode => _patient.code ?? '';

  String get patientYearOfBirth {
    if (_patient.birthday == null) return _patient.yearOfBirth?.toString() ?? '';
    
    return _formatDate(_patient.birthday);
  }

  String _formatDate(String inputDate) {
    final inputDateFormat = DateFormat('yyyy-MM-ddTHH:mm:ss.SSS+00:00');
    final outputDateFormat = DateFormat('dd/MM/yyyy');
    final inputDateTime = inputDateFormat.parse(inputDate);
    final outputDateTime = outputDateFormat.format(inputDateTime);

    return outputDateTime;
  }

  String get patientGender {
    if (_genderParamType.isEmpty) return '';

    final getCode = LocalizationService.currentLanguage.locale.languageCode;
    final paramType = _genderParamType.firstWhere((element) => element.key == _patient.gender);
    return LanguageStringFromJson.extractString(paramType.value ?? '', getCode);
  }

  String get patientPhoneNumber {
    var phone = _patient.phone ?? '';

    if (phone.isNotEmpty) {
      final formatter = NumberFormat('#,###');
      final formatPhone =  formatter.format(int.parse(phone)).replaceAll(',', ' ');

      return '${_patient.phoneCode ?? ''} $formatPhone';
    }

    return '';
  }

  String get patientGenderImageUrl {
    if (_genderParamType.isNotEmpty) {
      final paramType = _genderParamType.firstWhere((element) => element.key == _patient.gender);
      return paramType.mediaUrl ?? '';
    }

    return '';
  }

  String get patientEmail => _patient.email ?? '';

  String get patientNationalityName => _patient.nationalityName ?? '';

  String get patientStateName => _patient.stateName ?? '';

  String get patientCityName => _patient.cityName ?? '';

  String get patientAddress => _patient.address ?? '';

  String get patientDescription => _patient.description ?? '';

  Patient get patientEntity => _patient.copyWith();

  bool get shouldReloadData => _shouldReloadData;

  // Note
  List<NoteVM> get listNoteVM {
    return _listNote.map((e) {
      final id = (_noteCurrentPage) * _notePageLimit + _listNote.indexOf(e) + 1;
      final createdAt = DateTimeParserUtil().parseDateWithHour(e.createdAt ?? '');
      return NoteVM(id.toString(), e.description ?? '', e.logFullName ?? '', createdAt, e.id.toString());
    }).toList();
  }

  int get noteTotalPage => _noteTotalPage == 0 ? 1 : _noteTotalPage;

  int get noteCurrentPage => _noteCurrentPage;

  String get notePageCountString => 'Show ${(listNoteVM.isEmpty ? 0 : (noteCurrentPage * _notePageLimit + 1))} - ${_getCurrentNoteInPage(noteCurrentPage + 1)}/$_noteTotalItem';

  int _getCurrentNoteInPage(int page) {
    if (_noteTotalItem - _notePageLimit * page >= 0) {
      return 20 * page;
    } else {
      final result = _noteTotalItem;
      return result;
    }
  }

  // Assessment
  List<AssessmentVM> get listAssessmentVM {
    return _listAssessment.map((e) {
      final id = (_assessmentCurrentPage) * _assessmentPageLimit + _listAssessment.indexOf(e) + 1;
      return AssessmentVM(e, id.toString());
    }).toList();
  }

  int get assessmentTotalPage => _assessmentTotalPage == 0 ? 1 : _assessmentTotalPage;

  int get assessmentCurrentPage => _assessmentCurrentPage;

  String get assessmentPageCountString => 'Show ${(listAssessmentVM.isEmpty ? 0 : (assessmentCurrentPage * _assessmentPageLimit + 1))
      } -'
      ' ${_getCurrentAssessmentInPage(assessmentCurrentPage + 1)}'
      '/$_assessmentTotalItem';

  int _getCurrentAssessmentInPage(int page) {
    if (_assessmentTotalItem - _assessmentPageLimit * page >= 0) {
      return 20 * page;
    } else {
      final result = _assessmentTotalItem;
      return result;
    }
  }
}