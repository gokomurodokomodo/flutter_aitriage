import '../../../../aitriage_core/network/common/base_query.dart';

class ForgetPasswordQuery extends BaseQuery {
  final String email;

  ForgetPasswordQuery(this.email);

  @override
  Map<String, String> get toQuery => {
    'email': email
  };
}