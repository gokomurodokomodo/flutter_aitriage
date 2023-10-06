import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../aitriage_core/common/app_module.dart';
import 'patient_module_page_route.dart';

class PatientModule extends AppModule {
  @override
  List<GetPage> createRoutes() => PatientModulePageRoute.createRoutes();

  @override
  // TODO: implement apiPrefix
  String get apiPrefix => throw UnimplementedError();
}