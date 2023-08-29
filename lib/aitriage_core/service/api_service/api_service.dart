import 'package:flutter_aitriage/aitriage_core/service/api_service/get_country/get_country_uc.dart';
import 'package:get/get.dart';

class ApiService extends GetxService {
  final getCountryUseCase = GetCountryUseCase();
}