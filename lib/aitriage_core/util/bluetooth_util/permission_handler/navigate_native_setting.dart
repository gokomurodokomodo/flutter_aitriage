import 'package:app_settings/app_settings.dart';

class NavigateNativeSetting{
  void goToBluetoothSetting(){
    AppSettings.openAppSettings(type: AppSettingsType.bluetooth);
  }
}