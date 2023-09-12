import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// For encrypt data
class SecureStorageProvider {
  final securedBox = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      )
  );

  Future<void> writeSecured(String key, String value) async => await securedBox.write(key: key, value: value);

  Future readSecured(String key) async => await securedBox.read(key: key);

  Future<void> removeSecured(String key) async => await securedBox.delete(key: key);
}