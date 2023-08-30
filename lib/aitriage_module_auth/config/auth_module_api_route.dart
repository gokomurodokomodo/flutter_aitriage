class AuthModuleApiRoute {
  AuthModuleApiRoute._();

  static const apiPrefix = '/authen';
  static const register = '/auth/register';
  static const generateCode = '/twoFa/EMAIL/generate-code';
  static const getRegisterAccountParam = '/param-type/list';
}