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
          'baseUrl': 'https://dummyjson.com',
          'apiVersion': '',
          'apiPrefix': ''
        };
        break;
      case AppEnvironmentType.pro:
        _config = {
          'baseUrl': 'https://dummyjson.com',
          'apiVersion': '',
          'apiPrefix': ''
        };
        break;
    }
  }

  static AppEnvironmentType get environment => _env;
  static Map<String, dynamic> get config => _config;
  static String get baseUrl => _config['baseUrl'];
  static String get apiVersion => _config['apiVersion'];
  static String get apiPrefix => _config['apiPrefix'];

}