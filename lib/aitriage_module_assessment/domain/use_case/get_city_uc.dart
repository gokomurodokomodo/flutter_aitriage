import 'package:flutter_aitriage/aitriage_core/service/hivi_service/hivi_service.dart';
import 'package:get/get.dart';

import '../../../aitriage_core/entity/city.dart';

abstract class GetCityUseCase {
  List<City> execute(String id);
}

class GetCityUseCaseImpl extends GetCityUseCase {
  @override
  List<City> execute(String id) {
    final hiviService = Get.find<HiviService>();
    final list = hiviService.cities;
    return list;
  }
}