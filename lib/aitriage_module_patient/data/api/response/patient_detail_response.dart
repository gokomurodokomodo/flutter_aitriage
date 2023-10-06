import 'package:flutter_aitriage/aitriage_core/entity/patient.dart';
import '../../../../aitriage_core/network/common/base_response.dart';

class PatientDetailResponse extends BaseResponse{
  final Patient data;

  PatientDetailResponse.fromJson(dynamic json) : data = Patient.fromJson(json?['data']), super.fromJson(json);
}