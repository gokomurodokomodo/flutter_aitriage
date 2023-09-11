enum AppEnvironmentType { dev, pro }

class AppEnvironment {
  static AppEnvironmentType _env = AppEnvironmentType.pro;
  static Map<String, dynamic> _config = {};

  AppEnvironment._();

  static void setEnvironment(AppEnvironmentType env) {
    _env = env;

    switch (env) {
      case AppEnvironmentType.dev:
        _config = {
          'baseUrl': 'https://test-aitriage-api.beedu.vn',
          'apiVersion': '/v1',
          'apiPrefix': '',
          'publicPem': './lib/aitriage_core/asset/key/public_pem_dev.pem',
          'firebase-rtdb-url': 'https://aitriage-test-default-rtdb.asia-southeast1.firebasedatabase.app',
          'firebase-auth-key': '@!AITriage#230906',
        };
        break;
      case AppEnvironmentType.pro:
        _config = {
          'baseUrl': 'https://test-aitriage-api.beedu.vn',
          'apiVersion': '/v1',
          'apiPrefix': '',
          'publicPem': './lib/aitriage_core/asset/key/public_pem_dev.pem',
          'firebase-rtdb-url': 'https://aitriage-test-default-rtdb.asia-southeast1.firebasedatabase.app',
          'firebase-auth-key': '@!AITriage#230906',
        };
        break;
    }
  }

  static AppEnvironmentType get environment => _env;
  static Map<String, dynamic> get config => _config;
  static String get baseUrl => _config['baseUrl'];
  static String get apiVersion => _config['apiVersion'];
  static String get apiPrefix => _config['apiPrefix'];
  static String get publicPem => config['publicPem'];
  static String get firebaseRTDBUrl => config['firebase-rtdb-url'] as String;
  static String get firebaseAuthKey => config['firebase-auth-key'];
}