import 'package:flutter_aitriage/aitriage_core/network/common/base_request.dart';

class AddPatientNoteRequest extends BaseRequest {
  final String customerId;
  final String description;

  AddPatientNoteRequest(this.customerId, this.description);

  @override
  Map<String, dynamic> toRequest() => {
    'customerId': customerId,
    'description': description
  };
}