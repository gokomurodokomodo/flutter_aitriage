import 'package:flutter_aitriage/aitriage_core/entity/param_type.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/hivi_service.dart';
import 'package:get/get.dart';

abstract class GetGenderParamTypeUseCase {
  List<ParamType> execute();
}

class GetGenderParamUseCaseImpl extends GetGenderParamTypeUseCase {
  @override
  List<ParamType> execute() {
    final list = Get.find<HiviService>()
        .paramType
        .where((element) => element.groupType == 'GENDER')
        .toList();
    list.sort((a, b) => (a.position ?? 0).compareTo(b.position ?? 0));
    return list;
  }
}