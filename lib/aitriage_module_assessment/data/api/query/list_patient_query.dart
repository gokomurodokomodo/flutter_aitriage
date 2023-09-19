import 'package:flutter_aitriage/aitriage_core/network/common/base_query.dart';

class ListPatientQuery extends PageQuery {
  final String status;

  ListPatientQuery(super.page, super.limit, this.status);

  @override
  Map<String, String> get toQuery => super.toQuery..['status'] = status;
}