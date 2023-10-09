import 'package:flutter_aitriage/aitriage_core/network/common/base_query.dart';

class ListAssessmentByLocationQuery extends PageQuery {
  final String? search;
  final int? locationId;

  ListAssessmentByLocationQuery(super.page, super.limit, {this.search, this.locationId});

  @override
  Map<String, String> get toQuery {
    final query = super.toQuery;

    if (search != null && search != '') query['search'] = search.toString();

    if (locationId != null) query['locationId'] = locationId.toString();

    return query;
  }
}