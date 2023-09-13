import 'package:flutter_aitriage/aitriage_core/entity/system_param.dart';
import '../../../entity/param_type.dart';
import '../../../entity/race.dart';
import '../repository/get_system_param_repository.dart';

class GetAppParamUseCase {
  final _repository = GetSystemParamRepository();

  Future<AppParam> execute() async {
    final systemParamResp = await _repository.getSystemParam();
    final raceResp = await _repository.getRace();
    final paramTypes = await _repository.getParamType();
    final appParam = AppParam(
        systemParamResp.data,
        raceResp.data,
        paramTypes.data
    );

    return appParam;
  }
}

class AppParam {
  final SystemParam systemParam;
  final List<Race> races;
  final List<ParamType> paramTypes;

  AppParam(
      this.systemParam,
      this.races,
      this.paramTypes
  );
}