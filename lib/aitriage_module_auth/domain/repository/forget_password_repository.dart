import '../../../aitriage_core/network/common/base_response.dart';
import '../../data/api/query/forget_password_query.dart';

abstract class ForgetPasswordRepository {
  Future<BaseResponse> sendPasswordResetVerifiedCode(ForgetPasswordQuery query);
}