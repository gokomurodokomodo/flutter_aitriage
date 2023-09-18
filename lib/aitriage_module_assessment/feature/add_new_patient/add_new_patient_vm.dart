import 'package:flutter_aitriage/aitriage_core/entity/country.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/data/api/request/add_patient_request.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/entity/city.dart';
import '../../../aitriage_core/entity/patient.dart';
import '../../../aitriage_core/entity/race.dart';
import '../../../aitriage_core/entity/state.dart';
import '../../../aitriage_core/service/localization_service/localization_service.dart';
import '../../../aitriage_core/util/language_string_from_json/language_string_from_json.dart';
import 'package:intl/intl.dart';

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
  }) {
    // location id need to be first

    _locationId = locationId ?? _locationId;

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
      final list = cities.where((element) => element.countryId == _locationId).toList();
      _cities.addAll(list);
    }

    if (states != null) {
      _states.clear();
      final list = states.where((element) => element.countryId == _locationId).toList();
      _states.addAll(list);
    }

    // data for request
    _mrn = mrn ?? _mrn;
    _patientName = patientName ?? _patientName;
    _email = email ?? _email;
    _address = address ?? _address;
    _description = description ?? _description;
    _phoneNumber = phoneNumber ?? _phoneNumber;

    if (raceIndex != null && raceIndex < _races.length) _raceId = _races[raceIndex].id;
    if (nationalityIndex != null && nationalityIndex < _nationalities.length) _nationalityId = _nationalities[nationalityIndex].id;
    if (cityIndex != null && cityIndex < _cities.length) _cityId = _cities[cityIndex].id;
    if (stateIndex != null && stateIndex < _states.length) _stateId = _states[stateIndex].id;
    if (genderIndex != null && genderIndex < _genders.length) _gender = _genders[genderIndex];

    if (date != null) {
      _dob = null;
      _yearOfBirth = null;

      if (isDdMmYyyy(date)) {
        _dob = convertDdMmyyyyToYyyyMmDdHhMmSs(date);
      } else if (date.length == 4 && date.isNumericOnly) {
        _yearOfBirth = int.parse(date);
      }
    }
  }

  bool isDdMmYyyy(String string) {
    var formatter = DateFormat('dd/MM/yyyy');

    try {
      final dateTime = formatter.parse(string);
      return true;
    } catch (e) {
      return false;
    }
  }

  String convertDdMmyyyyToYyyyMmDdHhMmSs(String string) {
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
  List<String> get cities => _cities.map((e) => e.name ?? '').toList();
  List<String> get states => _states.map((e) => e.name ?? '').toList();

  AddPatientRequest get getAddPatientRequest {
    final patient = Patient(
        _mrn,
        _patientName,
        _nationalityId,
        _locationId,
        _stateId,
        _cityId,
        _raceId,
        _address,
        _gender,
        null,
        _phoneNumber,
        _email,
        _description,
        _dob,
        _yearOfBirth);
    return AddPatientRequest(patient);
  }
}