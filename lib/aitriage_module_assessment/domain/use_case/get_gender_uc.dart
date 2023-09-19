import 'package:flutter_aitriage/aitriage_core/service/hivi_service/hivi_service.dart';
import 'package:get/get.dart';

abstract class GetGenderUseCase {
  List<String> execute();
}

class GetGenderUseCaseImpl extends GetGenderUseCase {
  @override
  List<String> execute() {
    final hiviService = Get.find<HiviService>();
    final sortList = hiviService.paramType;
    sortList.sort((a, b) => (a.position ?? 0).compareTo(b.position ?? 0));
    final list = sortList
        .where((element) => element.groupType == 'GENDER')
        .map((e) => e.value ?? '')
        .toList();

    return list;
  }
}