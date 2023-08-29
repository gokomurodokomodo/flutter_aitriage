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
          'publicPem': './lib/aitriage_core/asset/key/public_pem_dev.pem'
        };
        break;
      case AppEnvironmentType.pro:
        _config = {
          'baseUrl': 'https://test-aitriage-api.beedu.vn',
          'apiVersion': '/v1',
          'apiPrefix': '',
          'publicPem': './lib/aitriage_core/asset/key/public_pem_dev.pem'
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

}