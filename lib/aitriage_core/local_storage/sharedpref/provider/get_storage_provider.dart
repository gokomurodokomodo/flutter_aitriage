import 'package:get_storage/get_storage.dart';

// For non encrypt data
class GetStorageProvider {
  final GetStorage getStorage = GetStorage();

  Future<void> write(String key, dynamic value) async => await getStorage.write(key, value);

  Future read(String key) async => await getStorage.read(key);

  Future<void> remove(String key) async => await getStorage.remove(key);
}