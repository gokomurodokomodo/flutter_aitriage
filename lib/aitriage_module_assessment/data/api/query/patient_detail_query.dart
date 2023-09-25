import 'package:flutter_aitriage/aitriage_core/network/common/base_query.dart';

class PatientDetailQuery extends BaseQuery {
  final String customerId;

  PatientDetailQuery(this.customerId);

  @override
  Map<String, String> get toQuery => {
    'customerId': customerId
  };
}