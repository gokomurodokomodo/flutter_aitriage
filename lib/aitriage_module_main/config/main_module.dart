import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../aitriage_core/common/app_module.dart';
import 'main_module_page_route.dart';

class MainModule extends AppModule {
  @override
  List<GetPage> createRoutes() => MainModulePageRoute.createRoutes();

  @override
  // TODO: implement apiPrefix
  String get apiPrefix => throw UnimplementedError();
}