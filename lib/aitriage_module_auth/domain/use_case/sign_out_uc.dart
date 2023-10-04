import 'package:flutter_aitriage/aitriage_core/util/active_user/active_user.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/repository/sign_out_repository.dart';
import '../../../aitriage_core/network/common/base_response.dart';

abstract class SignOutUseCase {
  Future<BaseResponse> execute();
}

class SignOutUseCaseImpl extends SignOutUseCase {
  final SignOutRepository _repository;

  SignOutUseCaseImpl(this._repository);

  @override
  Future<BaseResponse> execute() async {
    final userInfo = await ActiveUserUtil.userInfo;
    final resp = await _repository.signOut(userInfo.id.toString(), userInfo.accessToken.toString());
    await ActiveUserUtil.userLogOut();

    return resp;
  }
}

