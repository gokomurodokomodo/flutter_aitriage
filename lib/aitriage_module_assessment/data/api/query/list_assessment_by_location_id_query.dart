import 'package:flutter_aitriage/aitriage_core/network/common/base_query.dart';

class ListAssessmentByLocationIdQuery extends PageQuery {
  final String? customerId;

  ListAssessmentByLocationIdQuery(super.page, super.limit, {this.customerId});

  @override
  Map<String, String> get toQuery {
    final query = super.toQuery;

    if (customerId != null && customerId != '') query['customerId'] = customerId!;

    return query;
  }
}