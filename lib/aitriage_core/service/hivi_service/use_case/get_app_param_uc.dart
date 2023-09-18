import 'package:flutter_aitriage/aitriage_core/entity/system_param.dart';
import '../../../entity/param_type.dart';
import '../../../entity/race.dart';
import '../../../entity/role.dart';
import '../repository/get_app_param_repository.dart';

class GetAppParamUseCase {
  final _repository = GetAppParamRepository();

  Future<AppParam> execute() async {
    final systemParamResp = await _repository.getSystemParam();
    final raceResp = await _repository.getRace();
    final paramTypes = await _repository.getParamType();
    // final roles = await _repository.getRole();
    final appParam = AppParam(
        systemParamResp.data,
        raceResp.data,
        paramTypes.data,
        // roles.data
    );

    return appParam;
  }
}

class AppParam {
  final SystemParam systemParam;
  final List<Race> races;
  final List<ParamType> paramTypes;
  // final List<Role> roles;

  AppParam(
      this.systemParam,
      this.races,
      this.paramTypes,
      // this.roles
  );
}