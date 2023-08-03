import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_env.dart';
import 'package:get/get.dart';
import 'package:sizer_pro/sizer.dart';
import 'home_screen/page/home_screen_page.dart';

void mainDelegate(AppEnvironmentType appEnvironment) async {
  WidgetsFlutterBinding.ensureInitialized();
  final pages = initAppModule();
  AppEnvironment.setEnvironment(appEnvironment);
  _initService();
  _initLocalStorage();
  _initFirebase();
  // await _initLocalization();

  runApp(App(pages: pages));
}

List<GetPage> initAppModule() {
  final pages = <GetPage>[];

  return pages;
}

void _initService() async{}

void _initLocalStorage() {}

void _initFirebase() {}

// Future<void> _initLocalization() async => LocalizationService.loadLanguage();

class App extends StatelessWidget {
  const App({Key? key, required this.pages}) : super(key: key);
  final List<GetPage> pages;

  @override
  Widget build(BuildContext context) {
    // return ScreenUtilInit(
    //   builder: (BuildContext context, Widget? child) {
    //     return GetMaterialApp(
    //       //init page route
    //       // initialRoute: FirstModulePageRoute.firstPage,
    //       getPages: pages,
    //       //init localize
    //       translations: LocalizationService(),
    //       locale: LocalizationService.currentLocale,
    //       fallbackLocale: LocalizationService.fallbackLocale,
    //     );
    //   },
    // );
    return Sizer(
        builder: (context, orientation, deviceType) {
          return const MaterialApp(
            home: SafeArea(
              child: Scaffold(
                body: HomeScreenPage(),
              ),
            ),
          );
        }
    );
  }
}