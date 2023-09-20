import 'package:flutter_aitriage/aitriage_core/entity/country.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/data/api/request/add_patient_request.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../aitriage_core/entity/city.dart';
import '../../../aitriage_core/entity/patient.dart';
import '../../../aitriage_core/entity/race.dart';
import '../../../aitriage_core/entity/state.dart';
import '../../../aitriage_core/service/localization_service/localization_service.dart';
import '../../../aitriage_core/util/language_string_from_json/language_string_from_json.dart';

class AddNewPatientVM {
  // data for view
  final _genders = <String>[];
  final _races = <Race>[];
  final _nationalities = <Country>[];
  final _cities = <City>[];
  final _states = <State>[];
  // data for request
  var _mrn = '';
  var _patientName = '';
  String? _dob;
  int? _yearOfBirth;
  var _gender = '';
  int? _raceId;
  var _phoneNumber = '';
  var _email = '';
  int? _nationalityId;
  int? _locationId;
  int? _stateId;
  int? _cityId;
  var _address = '';
  var _description = '';
  // _stateIndex for filtering city
  int? _stateIndex;
  var _phoneCode = '';
  int? _countryId;

  void update({
    List<String>? genders,
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
    String? phoneNumber,
    String? email,
    int? nationalityIndex,
    int? stateIndex,
    int? cityIndex,
    String? address,
    String? description,
    String? phoneCode,
    int? countryId
  }) {
    // location id need to be first

    _locationId = locationId ?? _locationId;
    _countryId = countryId ?? _countryId;

    if (genders != null) {
      final getCode = LocalizationService.currentLanguage.locale.languageCode;
      final list = genders.map((e) => LanguageStringFromJson.extractString(e, getCode)).toList();
      _genders.clear();
      _genders.addAll(list);
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
    _phoneNumber = phoneNumber ?? _phoneNumber;
    _phoneCode = phoneCode ?? _phoneCode;

    if (raceIndex != null && raceIndex < _races.length) _raceId = _races[raceIndex].id;
    if (nationalityIndex != null && nationalityIndex < _nationalities.length) _nationalityId = _nationalities[nationalityIndex].id;
    if (cityIndex != null && cityIndex < this.cities.length) {
      final cityName = this.cities[cityIndex];
      _cityId = _cities.firstWhereOrNull((element) => element.name == cityName)?.id;
    }// get id from mapped city
    if (stateIndex != null && stateIndex < _states.length) {
      _stateId = _states[stateIndex].id;
      _stateIndex = stateIndex;
    }
    if (genderIndex != null && genderIndex < _genders.length) _gender = _genders[genderIndex];

    if (date != null) {
      _dob = null;
      _yearOfBirth = null;

      if (isDdMmYyyy(date)) {
        _dob = convertDdMmYyyyToYyyyMmDdHhMmSs(date);
      } else if (date.length == 4 && date.isNumericOnly) {
        _yearOfBirth = int.parse(date);
      }
    }
    // print('countryId $_countryId');
    // print('city index $cityIndex');
    // print('city id $_cityId');
  }

  bool isDdMmYyyy(String string) {
    var formatter = DateFormat('dd/MM/yyyy');

    try {
      formatter.parse(string);
      return true;
    } catch (e) {
      return false;
    }
  }

  String convertDdMmYyyyToYyyyMmDdHhMmSs(String string) {
    var sourceFormatter = DateFormat('dd/MM/yyyy');
    var targetFormatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    DateTime dateTime = sourceFormatter.parse(string);
    // Set the hour, minute, and second to 0.
    dateTime = dateTime.copyWith(hour: 0, minute: 0, second: 0);
    String formattedString = targetFormatter.format(dateTime);
    return formattedString;
  }

  List<String> get genders => _genders.toList();
  List<String> get races => _races.map((e) => e.name ?? '').toList();
  List<String> get nationalities => _nationalities.map((e) => e.nationality ?? '').toList();

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
        gender: _gender,
        phoneCode: _phoneCode,
        email: _email,
        description: _description,
        birthday: _dob,
        yearOfBirth: _yearOfBirth);

    return AddPatientRequest(patient);
  }

  bool get shouldEnableCityDropDown => _stateIndex != null;
}