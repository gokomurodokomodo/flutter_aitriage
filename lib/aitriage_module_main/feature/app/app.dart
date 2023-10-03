import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/util/active_user/active_user.dart';
import 'package:flutter_aitriage/aitriage_core/util/global_function.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../aitriage_core/common/app_image.dart';
import '../../../aitriage_core/service/localization_service/localization_service.dart';
import '../../../aitriage_core/util/app_event_channel/core/app_event_channel.dart';
import '../../../aitriage_core/util/app_event_channel/custom_event/finish_init_event.dart';
import '../../../aitriage_core/util/device_util.dart';
import '../../../aitriage_core/util/subscription_collector/subscription_collector.dart';
import '../../config/main_module_page_route.dart';
import '../splash_screen/splash_screen.dart';

class App extends StatefulWidget {
  final List<GetPage> pages;

  const App({
    super.key,
    required this.pages
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with SubscriptionCollector {
  var finishInit = false;
  var initialRoute = MainModulePageRoute.intro;

  @override
  void initState(){
    super.initState();
    final appEventChannel = AppEventChannel();
    final lastEvent = appEventChannel.getLastEvent<FinishInitEvent>();
    // Sometime init in MainDelegate finish before runApp()
    // So the stream listen after the event being fired
    // We must check the last event before listen
    if (lastEvent == null) {
      final subscription = appEventChannel
          .on<FinishInitEvent>()
          .listen((event) => notifyFinishInit());
      addToCollector(subscription);
    } else {
      notifyFinishInit();
    }
  }

  void notifyFinishInit() async {
    // Close appEventChannel
    disposeAllStreamInCollector();

    if (await shouldLaunchIntroScreen) {
      // Preload image asset
      await preloadImage();
      // Future.delayed to avoid calling setState in build phase
      // Do not remove
      await Future.delayed(Duration.zero);

    } else {
      initialRoute = MainModulePageRoute.main;
    }

    setState(() => finishInit = true);
  }
  
  Future preloadImage() async {
    switch (DeviceUtil.isTablet) {
      case true:
        cachedImage.add(Image.asset(AppImage.bgTabletBackgroundSplashScreen));

        for (int i = 1; i <= 4; i++) {
          cachedImage.add(Image.asset('./lib/aitriage_core/asset/image/bg_intro_${i}_tablet.png', fit: BoxFit.fitWidth));
        }

        break;
      case false:
        cachedImage.add(Image.asset(AppImage.bgSplashScreen));

        for (int i = 1; i <= 4; i++) {
          cachedImage.add(Image.asset('./lib/aitriage_core/asset/image/bg_intro_$i.png', fit: BoxFit.fitWidth));
        }

        break;
    }

    for (var item in cachedImage) {
      await precacheImage(item.image, context);
    }
  }

  Future<bool> get shouldLaunchIntroScreen async {
    try {
      final accessToken = await ActiveUserUtil.accessToken;

      if (accessToken.isEmpty) return true;
    } catch (e) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    // Display SplashScreen first
    // When all init done load Main screen
    return !finishInit
        ? const SplashScreen()
        : ScreenUtilInit(
            designSize: DeviceUtil.isTablet
                ? const Size(1440, 1024)
                : const Size(375, 812),
            builder: (BuildContext context, Widget? child) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                smartManagement: SmartManagement.full,
                // Init page route
                initialRoute: initialRoute,
                getPages: widget.pages,
                theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme(
                  
                )),
                // Init localize
                translations: LocalizationService(),
                locale: LocalizationService.currentLocale,
                fallbackLocale: LocalizationService.fallbackLocale,
              );
            });
  }
}