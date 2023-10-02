import 'package:encrypt/encrypt.dart';
import 'package:flutter/services.dart';
import 'package:pointycastle/asymmetric/api.dart';
import '../../common/app_env.dart';

class CryptoUtil {
  CryptoUtil._();

  static Future<String> encrypt(String pwd) async {
    try {
      final publicPem = await rootBundle.loadString(AppEnvironment.publicPem);
      final publicKey = RSAKeyParser().parse(publicPem) as RSAPublicKey;
      final encryptor = Encrypter(RSA(publicKey: publicKey));
      final encrypted = encryptor.encrypt(pwd);
      return encrypted.base64;
    } catch(e) {
      return e.toString();
    }
  }
}