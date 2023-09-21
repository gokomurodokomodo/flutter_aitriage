import 'package:flutter_aitriage/aitriage_core/entity/patient.dart';

abstract class SearchPatientUseCase {
  Future<List<Patient>> execute();
}

class SearchPatientUseCaseImpl extends SearchPatientUseCase {
  // if network on, search by api
  // if network off, search local db
  @override
  Future<List<Patient>> execute() {
    // TODO: implement execute
    throw UnimplementedError();
  }
}

