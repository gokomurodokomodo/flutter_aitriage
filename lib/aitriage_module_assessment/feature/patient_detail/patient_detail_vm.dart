import 'package:flutter_aitriage/aitriage_core/entity/note.dart';
import 'package:intl/intl.dart';
import '../../../aitriage_core/common/app_image.dart';
import '../../../aitriage_core/entity/param_type.dart';
import '../../../aitriage_core/entity/patient.dart';
import '../../../aitriage_core/service/localization_service/localization_service.dart';
import '../../../aitriage_core/util/language_string_from_json/language_string_from_json.dart';
import '../../widget/patient_detail_note.dart';

class PatientDetailVM {
  var _patient = Patient();
  final _genderParamType = <ParamType>[];
  final _listNote = <Note>[];
  var _shouldReloadData = false;
  // Note view variable
  var _totalPage = 1;
  var _currentPage = 0;
  var _pageLimit = 0;
  var _totalItem = 0;

  void update({
    Patient? patient,
    List<ParamType>? genderParamType,
    List<Note>? listNote,
    bool? shouldReloadData,
    int? totalPage,
    int? currentPage,
    int? pageLimit,
    int? totalItem
  }) {
    _patient = patient ?? _patient;
    _shouldReloadData = shouldReloadData ?? _shouldReloadData;
    _totalPage = totalPage ?? _totalPage;
    _currentPage = currentPage ?? _currentPage;
    _pageLimit = pageLimit ?? _pageLimit;
    _totalItem = totalItem ?? _totalItem;

    if (genderParamType != null) {
      _genderParamType.clear();
      _genderParamType.addAll(genderParamType);
    }

    if (listNote != null) {
      _listNote.clear();
      _listNote.addAll(listNote);
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

  List<NoteVM> get listNoteVM {
    return _listNote.map((e) {
      final id = (_currentPage) * _pageLimit + _listNote.indexOf(e) + 1;
      return NoteVM(id.toString(), e.description ?? '', e.logFullName ?? '', e.createdAt ?? '');
    }).toList();
  }

  int get totalPage => _totalPage == 0 ? 1 : _totalPage;

  int get currentPage => _currentPage;

  String get pageCountString => 'Show ${(currentPage) * _pageLimit + 1} - ${_getCurrentPatientInPage(currentPage + 1)}/$_totalItem';

  int _getCurrentPatientInPage(int page) {
    if (_totalItem - _pageLimit * page >= 0) {
      return 20 * page;
    } else {
      final result = _totalItem;
      return result;
    }
  }
}