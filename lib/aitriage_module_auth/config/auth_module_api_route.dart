class AuthModuleApiRoute {
  AuthModuleApiRoute._();

  static const apiPrefix = '/authen';
  static const register = '/auth/register';
  static const generateCode = '/twoFa/EMAIL/generate-code';
  static const verifyEmail = '/twoFa/EMAIL/verify-code';
  static const forgetPassword = '/auth/forget-pass/request';
  static const signIn = '/auth/login';
  static const logOut = '/user/%s/logout';
}