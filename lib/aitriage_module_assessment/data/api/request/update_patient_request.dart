import '../../../../aitriage_core/entity/patient.dart';
import '../../../../aitriage_core/network/common/base_request.dart';

class UpdatePatientRequest extends BaseRequest {
  final Patient patient;

  UpdatePatientRequest(this.patient);

  @override
  Map<String, dynamic> toRequest() => {
    'id': patient.id,
    'code': patient.code,
    'fullName': patient.fullName,
    'nationalityId': patient.nationalityId,
    'locationId': patient.locationId,
    'stateId': patient.stateId,
    'cityId': patient.cityId,
    'raceId': patient.raceId,
    'address': patient.address,
    'gender': patient.gender,
    'phoneCode': patient.phoneCode,
    'phone': patient.phone,
    'email': patient.email,
    'description': patient.description,
    'birthday': patient.birthday,
    'yearOfBirth': patient.yearOfBirth,
    'avatar': patient.avatar,
    'raceName': patient.raceName,
    'age': patient.age,
    'lastActivityDate': patient.lastActivityDate,
    'cityName': patient.cityName,
    'nationalityName': patient.nationalityName,
    'stateName': patient.stateName,
    'responseDetail': true
  };
}