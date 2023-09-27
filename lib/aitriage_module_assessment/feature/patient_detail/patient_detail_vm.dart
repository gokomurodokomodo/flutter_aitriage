import '../../../aitriage_core/common/app_image.dart';
import '../../../aitriage_core/entity/patient.dart';

class PatientDetailVM {
  var _patient = Patient();

  void update({
    Patient? patient
  }) {
    _patient = patient ?? _patient;
  }

  String get patientAvatar => _patient.avatar ?? '';

  String get patientErrorAvatar => switch (_patient.gender) {
    'MALE' => AppImage.icDefaultAvatarMale,
    'FEMALE' => AppImage.icDefaultAvatarFemale,
    _ => AppImage.icDefaultAvatarMale
  };

  String get patientFullName => _patient.fullName ?? '';

  String get patientRaceName => _patient.raceName ?? '';

  String get patientAge => '${_patient.age?.toString() ?? ''} years old';

  String get patientCode => _patient.code ?? '';

  String get patientYearOfBirth => _patient.yearOfBirth?.toString() ?? '';

  String get patientGender => _patient.gender ?? '';

  String get patientPhoneCode => _patient.phoneCode ?? '';

  String get patientEmail => _patient.email ?? '';

  String get patientNationalityName => _patient.nationalityId.toString() ?? '';

  String get patientStateName => _patient.stateId.toString() ?? '';

  String get patientCityName => _patient.cityName ?? '';

  String get patientAddress => _patient.address ?? '';

  String get patientDescription => _patient.description ?? '';
}