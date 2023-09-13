import 'package:get/get.dart';
import '../../../aitriage_core/entity/param_type.dart';
import '../../../aitriage_core/service/hivi_service/hivi_service.dart';
import '../../../aitriage_core/service/hivi_service/response/get_param_type_response.dart';

abstract class GetRegisterAccountStatusUseCase {
  List<ParamType> execute();
}

class GetRegisterAccountStatusUseCaseImpl extends GetRegisterAccountStatusUseCase {
  @override
  List<ParamType> execute() {
    final list = Get.find<HiviService>().paramType
        .where((e) => e.groupType == ParamTypeGroupType.registerAccountStatus.stringValue)
        .toList();

    return list;
  }
}
