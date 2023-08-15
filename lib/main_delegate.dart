import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_env.dart';
import 'package:flutter_aitriage/aitriage_core/util/app_event_channel/core/app_event_channel.dart';
import 'package:flutter_aitriage/aitriage_core/util/device_util.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/config/assessment_module.dart';
import 'package:flutter_aitriage/aitriage_module_overview/config/overview_module.dart';
import 'package:flutter_aitriage/aitriage_module_setting/config/setting_module.dart';
import 'package:get/get.dart';
import 'aitriage_core/common/app_module.dart';
import 'aitriage_core/service/localization_service.dart';
import 'package:get_storage/get_storage.dart';
import 'aitriage_core/util/app_event_channel/custom_event/finish_init_event.dart';
import 'aitriage_module_authen/config/authen_module.dart';
import 'aitriage_module_main/config/main_module.dart';
import 'aitriage_module_main/feature/app/app.dart';

// All logic init
void mainDelegate(AppEnvironmentType appEnvironment) async {
  // If you are using the async keyword in your main function,
  // you will need to call WidgetsFlutterBinding.ensureInitialized()
  // before calling await any other methods.
  // This is because the await keyword will not work until the WidgetsBinding has been initialized.
  WidgetsFlutterBinding.ensureInitialized();
  AppEnvironment.setEnvironment(appEnvironment);
  final appEventChannel = AppEventChannel();
  final pages = _initAppModule();
  await _setPreferOrientation();
  await _setImmersiveModeOnTablet();
  // Using Future.wait to avoid blocking UI before launch splash screen
  Future.wait([
    _initLocalization(),
    _initLocalStorage(),
    _initService(),
    _initFirebase()
  ]).then((value) => appEventChannel.addEvent(FinishInitEvent('done')));

  runApp(App(pages: pages));
}

Future<void> _setPreferOrientation() async=> DeviceUtil.isTablet
      ? SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      : SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

Future<void> _setImmersiveModeOnTablet() async{
  if(DeviceUtil.isTablet) SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
}


List<GetPage> _initAppModule() {
  final pages = <GetPage<dynamic>>[];
  final module = <AppModule>[];
  module.add(MainModule());
  module.add(AssessmentModule());
  module.add(OverviewModule());
  module.add(SettingModule());
  module.add(AuthenModule());

  for(var item in module){
    pages.addAll(item.createRoutes());
  }

  return pages;
}

Future<void> _initLocalStorage() => GetStorage.init();

Future<void> _initLocalization() => LocalizationService.loadLanguage();

Future _initFirebase() async {}

Future _initService() async {}




