import '../../../aitriage_core/entity/country.dart';
import '../repository/patient_repository.dart';

abstract class GetNationalityUseCase {
  Future<List<Country>> execute();
}

class GetNationalityUseCaseImpl extends GetNationalityUseCase {
  final PatientRepository _repository;

  GetNationalityUseCaseImpl(this._repository);

  @override
  Future<List<Country>> execute() async {
    final resp = await _repository.getNationality();
    return resp.data;
  }
}

