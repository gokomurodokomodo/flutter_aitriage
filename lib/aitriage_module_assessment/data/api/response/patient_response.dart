import 'package:flutter_aitriage/aitriage_core/entity/patient.dart';
import 'package:flutter_aitriage/aitriage_core/network/common/base_response.dart';

class PatientResponse extends BaseResponse{
  List<Patient> patient = [];
  var totalMale = 0;
  var totalFemale = 0;
  var totalPage = 0;
  var totalElement = 0;
  
  PatientResponse.fromJson(dynamic json) : super.fromJson(json){
    for (var element in json['data']['customers']['content'] as List<dynamic>) {
      patient.add(Patient.fromJson(element));
    }

    totalMale = json?['data']?['totalMale'] ?? 0;
    totalFemale = json?['data']?['totalFemale'] ?? 0;
    totalPage = json?['data']?['customers']?['totalPages'] ?? 1;
    totalElement = json?['data']?['totalElements'] ?? 0;
  }

}