import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_env.dart';
import 'package:get/get.dart';

import 'aitriage_core/service/localization_service.dart';

void mainDelegate(AppEnvironmentType appEnvironment) async {
  WidgetsFlutterBinding.ensureInitialized();
  final pages = initAppModule();
  AppEnvironment.setEnvironment(appEnvironment);
  _initService();
  _initLocalStorage();
  _initFirebase();
  await _initLocalization();

  runApp(App(pages: pages));
}

List<GetPage> initAppModule() {
  final pages = <GetPage>[];

  return pages;
}

void _initService() {}

void _initLocalStorage() {}

void _initFirebase() {}

Future<void> _initLocalization() async => LocalizationService.loadLanguage();

class App extends StatelessWidget {
  const App({Key? key, required this.pages}) : super(key: key);
  final List<GetPage> pages;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //init page route
      // initialRoute: FirstModulePageRoute.firstPage,
      getPages: pages,
      //init localize
      translations: LocalizationService(),
      locale: LocalizationService.currentLocale,
      fallbackLocale: LocalizationService.fallbackLocale,
    );
  }
}