import 'package:flutter_aitriage/aitriage_core/entity/system_param.dart';
import '../../../entity/param_type.dart';
import '../../../entity/race.dart';
import '../repository/get_app_param_repository.dart';

typedef AppParam = ({
  SystemParam systemParam,
  List<Race> races,
  List<ParamType> paramTypes
});

class GetAppParamUseCase {
  final _repository = GetAppParamRepository();

  Future<AppParam> execute() async {
    final systemParamResp = await _repository.getSystemParam();
    final raceResp = await _repository.getRace();
    final paramTypes = await _repository.getParamType();

    return (
      systemParam: systemParamResp.data,
      races: raceResp.data,
      paramTypes: paramTypes.data
    );
  }
}