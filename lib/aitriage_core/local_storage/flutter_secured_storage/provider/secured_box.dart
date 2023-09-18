import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecuredBox{
  SecuredBox._();

  static final _instance = SecuredBox._();

  factory SecuredBox()  => _instance;

  final FlutterSecureStorage _securedBox = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
        resetOnError: true,
      ));

  Future<void> write(
      {required String key,
      required String data}
    ) async{
    try {
      await _securedBox.write(key: key, value: data); 
    } catch (e) {
      log(e.toString());
    }
  }

  Future<String> read({
    required String key
    }) async {
      try {
        return await _securedBox.read(key: key) ?? ''; 
      } catch (e) {
        log(e.toString());
      }
    return '';
  }
}