import 'package:flutter_aitriage/aitriage_core/entity/patient.dart';
import 'package:flutter_aitriage/aitriage_core/network/common/base_request.dart';

class AddPatientRequest extends BaseRequest {
  final Patient patient;

  AddPatientRequest(this.patient);

  @override
  Map<String, dynamic> toRequest() => {
    "code": patient.code,
    "fullName": patient.fullName,
    "nationalityId": patient.nationalityId,
    "locationId": patient.locationId,
    "stateId": patient.stateId,
    "cityId": patient.cityId,
    "raceId": patient.raceId,
    "address": patient.address,
    "gender": patient.gender,
    "phoneCode": patient.phoneCode,
    "phone": patient.phone,
    "email": patient.email,
    "description": patient.description,
    "birthday": patient.birthday,
    "yearOfBirth": patient.yearOfBirth,
    "responseDetail": patient.responseDetail
  };
}