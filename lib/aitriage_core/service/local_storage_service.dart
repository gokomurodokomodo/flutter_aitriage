import 'package:flutter_aitriage/aitriage_core/common/app_constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorageService extends GetxService {
  LocalStorageService._();

  static final _instance = LocalStorageService._();

  factory LocalStorageService() => _instance;

  final GetStorage box = GetStorage();

  final FlutterSecureStorage securedBox = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ));

  void set({dynamic value, required String forKey}) {
    box.write(forKey, value);
  }

  T get<T>({required String key, required T defaultValue}) {
    return cast<T>(box.read(key)) ?? defaultValue;
  }

  T? getOrNull<T>({required String key}) {
    return cast<T>(box.read(key));
  }

  void remove({required String key}) {
    box.remove(key);
  }

  void removeSecured({required String key}) {
    securedBox.delete(key: key);
  }

  T? cast<T>(dynamic value, {T? defaultValue}) => value is T ? value : defaultValue;

  //
  set updateFirstTimeOpening(bool value) => box.write(AppConstant.firstTimeOpening, value);

  bool get firstTimeOpening => box.read(AppConstant.firstTimeOpening);
}