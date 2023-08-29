import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'device_info_model.dart';

class DeviceInfoUtils {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  Future<AndroidDeviceInfo> get androidDeviceInfo async =>
      await deviceInfo.androidInfo;
  Future<IosDeviceInfo> get iOSDeviceInfo async => await deviceInfo.iosInfo;

  Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();

  Future<DeviceInfo> get() {
    var isIOS = Platform.isIOS;

    if (isIOS) {
      return Future.wait([iOSDeviceInfo, packageInfo]).then((value) {
        var iosInfo = value.first as IosDeviceInfo;
        var packageInfo = value.elementAt(1) as PackageInfo;

        return DeviceInfo(
          deviceGuid: iosInfo.identifierForVendor,
          deviceSerial: iosInfo.identifierForVendor,
          deviceType: iosInfo.utsname.machine,
          deviceName: iosInfo.utsname.machine,
          deviceOs: Platform.operatingSystem,
          deviceToken: '',
          deviceEndPoint: '',
          appVersion: packageInfo.version,
          sourceType: 'MOBILE',
        );
      });
    } else {
      return Future.wait([androidDeviceInfo, packageInfo]).then((value) {
        var androidInfo = value.first as AndroidDeviceInfo;
        var packageInfo = value.elementAt(1) as PackageInfo;

        return DeviceInfo(
          deviceGuid: androidInfo.id,
          deviceSerial: androidInfo.id,
          deviceType: androidInfo.model,
          deviceName: androidInfo.model,
          deviceOs: Platform.operatingSystem,
          deviceToken: '',
          deviceEndPoint: '',
          appVersion: packageInfo.version,
          sourceType: 'MOBILE',
        );
      });
    }
  }

  Future<DeviceInfo> getHeader() {
    var isIOS = Platform.isIOS;

    if (isIOS) {
      return Future.wait([iOSDeviceInfo, packageInfo]).then((value) {
        var iosInfo = value.first as IosDeviceInfo;
        var packageInfo = value.elementAt(1) as PackageInfo;

        return DeviceInfo(
            deviceType: iosInfo.utsname.machine,
            deviceName: iosInfo.utsname.machine,
            deviceOs: Platform.operatingSystem,
            appVersion: packageInfo.version,
            versionCode: packageInfo.buildNumber,
            appName: 'aitriage',
            uuid: iosInfo.identifierForVendor,
            deviceOsVersion: 'ios ${iosInfo.systemVersion}');
      });
    } else {
      return Future.wait([androidDeviceInfo, packageInfo]).then((value) {
        var androidInfo = value.first as AndroidDeviceInfo;
        var packageInfo = value.elementAt(1) as PackageInfo;

        return DeviceInfo(
            deviceType: androidInfo.model,
            deviceName:
            '${androidInfo.brand} ${androidInfo.model}',
            deviceOs: Platform.operatingSystem,
            appVersion: packageInfo.version,
            versionCode: packageInfo.buildNumber,
            appName: 'aitriage',
            uuid: androidInfo.id,
            deviceOsVersion: 'android ${androidInfo.version.release}');
      });
    }
  }
}
