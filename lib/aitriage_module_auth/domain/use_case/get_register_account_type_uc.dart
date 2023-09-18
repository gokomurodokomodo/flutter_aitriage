import 'package:get/get.dart';
import '../../../aitriage_core/entity/param_type.dart';
import '../../../aitriage_core/service/hivi_service/hivi_service.dart';
import '../../../aitriage_core/service/hivi_service/response/get_param_type_response.dart';

abstract class GetRegisterAccountTypeUseCase {
  List<ParamType> execute();
}

class GetRegisterAccountTypeUseCaseImpl extends GetRegisterAccountTypeUseCase {
  @override
  List<ParamType> execute() {
    final list = Get.find<HiviService>().paramType
        .where((e) => e.groupType == ParamTypeGroupType.registerAccountType.stringValue)
        .toList();

    return list;
  }
}
