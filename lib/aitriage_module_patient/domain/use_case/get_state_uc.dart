import 'package:flutter_aitriage/aitriage_core/service/hivi_service/hivi_service.dart';
import 'package:get/get.dart';

import '../../../aitriage_core/entity/state.dart';

abstract class GetStateUseCase {
  List<State> execute(String id);
}

class GetStateUseCaseImpl extends GetStateUseCase {
  @override
  List<State> execute(String id) {
    final hiviService = HiviService.instance;
    final list = hiviService.states;

    return list;
  }
}