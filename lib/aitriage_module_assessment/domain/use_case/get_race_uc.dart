import 'package:flutter_aitriage/aitriage_core/service/hivi_service/hivi_service.dart';
import 'package:get/get.dart';

abstract class GetRaceUseCase {
  List<String> execute();
}

class GetRaceUseCaseImpl extends GetRaceUseCase {
  @override
  List<String> execute() {
    final hiviService = Get.find<HiviService>();
    final list = hiviService.listRace.map((e) => e.name ?? '').toList();

    return list;
  }
}