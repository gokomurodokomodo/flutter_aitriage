import 'package:flutter_aitriage/aitriage_core/network/common/base_query.dart';

class ListAssessmentByPatientIdQuery extends PageQuery {
  final String? customerId;

  ListAssessmentByPatientIdQuery(super.page, super.limit, {this.customerId});

  @override
  Map<String, String> get toQuery {
    final query = super.toQuery;

    if (customerId != null && customerId != '') query['customerId'] = customerId!;

    return query;
  }
}