import 'package:flutter_aitriage/aitriage_core/entity/country.dart';
import 'package:flutter_aitriage/aitriage_core/entity/param_type.dart';
import 'package:flutter_aitriage/aitriage_core/util/date_time_checker/date_time_checker_util.dart';
import 'package:flutter_aitriage/aitriage_core/util/regrex_constant/app_regrex.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/data/api/request/add_patient_request.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/entity/city.dart';
import '../../../aitriage_core/entity/patient.dart';
import '../../../aitriage_core/entity/race.dart';
import '../../../aitriage_core/entity/state.dart';
import '../../../aitriage_core/service/localization_service/localization_service.dart';
import '../../../aitriage_core/util/date_time_parse_util.dart';
import '../../../aitriage_core/util/language_string_from_json/language_string_from_json.dart';
import '../../data/api/request/update_patient_request.dart';

enum PatientScreenType { add, edit, unknown }

class AddNewPatientVM {
  // data for view
  final _genders = <ParamType>[];
  final _races = <Race>[];
  final _nationalities = <Country>[];
  final _cities = <City>[];
  final _states = <State>[];
  // data for request
  var _mrn = '';
  var _patientName = '';
  String? _dob;
  int? _yearOfBirth;
  int? _raceIndex;
  int? _nationalityIndex;
  int? _stateIndex;
  int? _cityIndex;
  int? _genderIndex;
  var _phone = '';
  var _email = '';
  int? _locationId;
  var _address = '';
  var _description = '';
  // _stateIndex for filtering city

  var _phoneCode = '';
  int? _countryId;
  // patient for edit screen
  Patient? _patient;

  //check first time
  bool isFirstTimeMRN = true;
  bool isFirstTimeNationality = true;
  bool isFirstTimePatientName = true;
  bool isFirstTimePatientState = true;
  bool isFirstTimeDateOfBirth = true;
  bool isFirstTimePatientCity = true;
  bool isFirstTimeGender = true;
  bool isFirstTimeRace = true;
  PatientScreenType _patientScreenType = PatientScreenType.unknown;

  void update({
    List<ParamType>? genders,
    List<Race>? races,
    List<Country>? nationalities,
    List<City>? cities,
    List<State>? states,
    // data for request
    int? locationId,
    String? mrn,
    String? patientName,
    String? date,
    int? genderIndex,
    int? raceIndex,
    String? phone,
    String? email,
    int? nationalityIndex,
    int? stateIndex,
    int? cityIndex,
    String? address,
    String? description,
    String? phoneCode,
    int? countryId,
    PatientScreenType? patientScreenType,
    Patient? patient
  }) {
    // location id need to be first
    _locationId = locationId ?? _locationId;
    _countryId = countryId ?? _countryId;
    _patientScreenType = patientScreenType ?? _patientScreenType;
    _patient = patient ?? _patient;

    if (genders != null) {
      _genders.clear();
      _genders.addAll(genders);
    }

    if (races != null) {
      _races.clear();
      _races.addAll(races);
    }

    if (nationalities != null) {
      _nationalities.clear();
      _nationalities.addAll(nationalities);
    }

    if (cities != null) {
      _cities.clear();
      final list = cities.where((element) => element.countryId == _countryId).toList();
      _cities.addAll(list);
    }

    if (states != null) {
      _states.clear();
      final list = states.where((element) => element.countryId == _countryId).toList();
      _states.addAll(list);
    }

    // data for request
    _mrn = mrn ?? _mrn;
    _patientName = patientName ?? _patientName;
    _email = email ?? _email;
    _address = address ?? _address;
    _description = description ?? _description;
    _phone = phone ?? _phone;
    _phoneCode = phoneCode ?? _phoneCode;
    _genderIndex = genderIndex ?? _genderIndex;
    _raceIndex = raceIndex ?? _raceIndex;
    _nationalityIndex = nationalityIndex ?? _nationalityIndex;
    _stateIndex = stateIndex ?? _stateIndex;
    _cityIndex = cityIndex ?? _cityIndex;

    if (date != null) {
      _dob = null;
      _yearOfBirth = null;
      if (date.length == 4 && date.isNumericOnly){
        _yearOfBirth = int.parse(date);
      } else {
        final isValidDate = DateTimeCheckerUtil().checkDate(date);
        print(isValidDate);
        if(isValidDate){
          _dob = DateTimeParserUtil().appFormatToBackendFormat(date);
        } else {
        }
      }
      print(_dob);
      print(_yearOfBirth);
    }
  }

  bool get isMRNVerify => _verifyStringNotNull(_mrn);
  bool get isNameVerify => _verifyStringNotNull(_patientName);
  bool get isNationalityVerify => _nationalityId != null;
  bool get isStateVerify => _stateId != null;
  bool get isDateVerify {
    return ((_dob != null || _yearOfBirth != null)) ? true : false;
    }
  bool get isCityVerify => _cityId != null;
  bool get isGenderVerify => _genderKey != '';
  bool get isRaceVerify => _raceId != null;
  bool get isEmailVerify {
    if(_email == '') {
      return true;
    } else{
      if(AppRegrex.emailRegrex.hasMatch(_email)){
        return true;
      } else {
        return false;
      }
    }
  }

  bool get shouldShowMRNMessage {
    return isMRNVerify || isFirstTimeMRN;
  } 
  bool get shouldShowNameMessage => isNameVerify || isFirstTimePatientName;
  bool get shouldShowNationalityMessage => isNationalityVerify || isFirstTimeNationality;
  bool get shouldShowStateMessage => isStateVerify || isFirstTimePatientState;
  bool get shouldShowDateMessage => isDateVerify || isFirstTimeDateOfBirth;
  bool get shouldShowCityMessage => isCityVerify || isFirstTimePatientCity;
  bool get shouldShowGenderMessage => isGenderVerify || isFirstTimeGender;
  bool get shouldShowRaceMessage => isRaceVerify || isFirstTimeRace;



  bool _verifyStringNotNull(String infomation){
    if(infomation == '') {
      return false;
    } else {
      return true;
    }
  }

  List<String> get races => _races.map((e) => e.name ?? '').toList();

  List<String> get nationalities => _nationalities.map((e) => e.nationality ?? '').toList();

  List<String> get genders {
    final getCode = LocalizationService.currentLanguage.locale.languageCode;
    final list = _genders.map((e) => LanguageStringFromJson.extractString(e.value ?? '', getCode)).toList();
    return list;
  }

  List<String> get cities {
    if (_stateIndex != null) {
      final stateId = _states[_stateIndex!].id;
      return _cities.where((element) {
        return element.stateId == stateId;
      }).map((e) => e.name ?? '').toList();
    } else {
      return [];
    }
  }

  List<String> get states => _states.map((e) => e.name ?? '').toList();

  AddPatientRequest get getAddPatientRequest {
    final patient = Patient(
        code: _mrn,
        fullName: _patientName,
        nationalityId: _nationalityId,
        locationId: _locationId,
        stateId: _stateId,
        cityId: _cityId,
        raceId: _raceId,
        address: _address,
        gender: _genderKey,
        phoneCode: _phoneCode,
        phone: _phone,
        email: _email,
        description: _description,
        birthday: _dob,
        yearOfBirth: _yearOfBirth,
    );

    return AddPatientRequest(patient);
  }

  UpdatePatientRequest get getEditPatient {
    final patient = _patient!.copyWith(
        code: _mrn,
        fullName: _patientName,
        nationalityId: _nationalityId,
        locationId: _locationId,
        stateId: _stateId,
        cityId: _cityId,
        raceId: _raceId,
        address: _address,
        gender: _genderKey,
        phoneCode: _phoneCode,
        phone: _phone,
        email: _email,
        description: _description,
        birthday: _dob,
        yearOfBirth: _yearOfBirth
    );

    return UpdatePatientRequest(patient);
  }

  bool get shouldEnableCityDropDown => _stateIndex != null;
  String get phoneCode => _phoneCode;

  void setFirstTimeMRN(){
    isFirstTimeMRN = false;
  }

  void setFirstTimeNationality(){
    isFirstTimeNationality = false;
  }

  void setFirstTimePatientName(){
    isFirstTimePatientName = false;
  }

  void setFirstTimePatientState(){
    isFirstTimePatientState = false;
  }

  void setFirstTimeDateOfBirth(){
    isFirstTimeDateOfBirth = false;
  }

  void setFirstTimePatientCity(){
    isFirstTimePatientCity = false;
  }

  void setFirstTimePatientGender(){
    isFirstTimeGender = false;
  }

  void setFirstTImePatientRace(){
    isFirstTimeRace = false;
  }

  bool get shouldEnableSaveButton {
    final result = isCityVerify 
                    && isDateVerify 
                    && isGenderVerify
                    && isMRNVerify
                    && isNameVerify
                    && isNationalityVerify
                    && isRaceVerify
                    && isStateVerify
                    && isEmailVerify
                    && !isFirstTimeDateOfBirth
                    && !isFirstTimeGender
                    && !isFirstTimeMRN
                    && !isFirstTimeNationality
                    && !isFirstTimePatientCity
                    && !isFirstTimePatientName
                    && !isFirstTimePatientState
                    && !isFirstTimeRace;
    return result;
  }

  int getNationalityIndex(String? nationalityName) {
    final index = nationalities.indexOf(nationalityName ?? '');
    return index;
  }


  int getStateIndex(String? stateName) {
    final index = states.indexOf(stateName ?? '');
    return index;
  }

  int getCityIndex(String? cityName) {
    final index = cities.indexOf(cityName ?? '');
    return index;
  }

  int getRaceIndex(String? raceName) {
    final index = races.indexOf(raceName ?? '');
    return index;
  }

  int getGenderIndex(String? key) {
    final index = _genders.map((e) => e.key).toList().indexOf(key);
    return index;
  }

  String get patientScreenTitle => switch (_patientScreenType) {
    PatientScreenType.add => 'ADD PATIENT',
    PatientScreenType.edit => 'EDIT PATIENT',
    _ => ''
  };

  String get _genderKey {
    return _genders.elementAtOrNull(_genderIndex ?? 0)?.key ?? '';
  }

  int? get _raceId => _races.elementAtOrNull(_raceIndex ?? 0)?.id;

  int? get _nationalityId => _nationalities.elementAtOrNull(_nationalityIndex ?? 0)?.id;

  int? get _stateId {
    return _states.elementAtOrNull(_stateIndex ?? 0)?.id;
  }

  int? get _cityId {
    final cityName = cities.elementAtOrNull(_cityIndex ?? 0);
    return _cities.firstWhereOrNull((element) => element.name == cityName && _stateId == element.stateId)?.id;
  }

  PatientScreenType get patientScreenType => _patientScreenType;
}