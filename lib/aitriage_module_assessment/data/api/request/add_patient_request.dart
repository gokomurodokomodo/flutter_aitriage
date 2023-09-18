import 'package:flutter_aitriage/aitriage_core/entity/patient.dart';
import 'package:flutter_aitriage/aitriage_core/network/common/base_request.dart';

class AddPatientRequest extends BaseRequest {
  final Patient data;

  AddPatientRequest(this.data);

  @override
  Map<String, dynamic> toRequest() => {
    "code": data.code,
    "fullName": data.fullName,
    "nationalityId": data.nationalityId,
    "locationId": data.locationId,
    "stateId": data.stateId,
    "cityId": data.cityId,
    "raceId": data.raceId,
    "address": data.address,
    "gender": data.gender,
    "phoneCode": data.phoneCode,
    "phone": data.phone,
    "email": data.email,
    "description": data.description,
    "birthday": data.birthday,
    "yearOfBirth": data.yearOfBirth
  };
}