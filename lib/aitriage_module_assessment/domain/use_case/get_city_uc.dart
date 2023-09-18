import 'package:flutter_aitriage/aitriage_core/service/hivi_service/hivi_service.dart';
import 'package:get/get.dart';

abstract class GetCityUseCase {
  List<String> execute(String id);
}

class GetCityUseCaseImpl extends GetCityUseCase {
  @override
  List<String> execute(String id) {
    final hiviService = Get.find<HiviService>();
    final list = hiviService.cities
        .where((element) => element.countryId.toString() == id)
        .map((e) => e.name ?? '')
        .toList();
    return list;
  }
}