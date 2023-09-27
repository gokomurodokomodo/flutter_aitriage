import 'package:flutter_aitriage/aitriage_core/network/common/base_query.dart';

class ListPatientQuery extends PageQuery {
  final String status;
  final String? search;

  ListPatientQuery(super.page, super.limit, this.status, {this.search});

  @override
  Map<String, String> get toQuery {
    final query = super.toQuery;

    if (search != null && search != '') query['search'] = search!;

    query['status'] = status;

    return query;
  }
}