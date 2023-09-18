import 'package:flutter_aitriage/aitriage_core/entity/race.dart';
import 'package:flutter_aitriage/aitriage_core/service/hivi_service/hivi_service.dart';
import 'package:get/get.dart';

abstract class GetRaceUseCase {
  List<Race> execute();
}

class GetRaceUseCaseImpl extends GetRaceUseCase {
  @override
  List<Race> execute() {
    final hiviService = Get.find<HiviService>();
    final list = hiviService.races;

    return list;
  }
}