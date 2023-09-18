import 'package:flutter_aitriage/aitriage_module_assessment/domain/repository/patient_repository.dart';

abstract class GetNationalityUseCase {
  Future<List<String>> execute();
}

class GetNationalityUseCaseImpl extends GetNationalityUseCase {
  final PatientRepository _repository;

  GetNationalityUseCaseImpl(this._repository);

  @override
  Future<List<String>> execute() async {
    final resp = await _repository.getNationality();
    return resp.data.map((e) => e.nationality ?? '').toList();
  }
}

