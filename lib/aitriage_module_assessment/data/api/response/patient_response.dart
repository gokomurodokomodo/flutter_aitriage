import 'package:flutter_aitriage/aitriage_core/entity/patient.dart';
import 'package:flutter_aitriage/aitriage_core/network/common/base_response.dart';

class PatientResponse extends BaseResponse{
  List<Patient> patient = [];
  
  PatientResponse.fromJson(dynamic json) : super.fromJson(json){
    for (var element in json['data']['customers']['content'] as List<dynamic>) {
      patient.add(Patient.fromJson(element));
    }
  }

}