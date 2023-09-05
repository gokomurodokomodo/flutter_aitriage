import '../../common/app_error.dart';

class HandleNetworkError {
  static const userNotExists = 'USER_NOT_EXISTS';
  static const countryNotExists = 'COUNTRY_NOT_EXISTS';
  static const weakPassword = 'WEAK_PASSWORD';
  static const emailAlreadyExists = 'EMAIL_ALREADY_EXISTS';
  static const phoneAlreadyExists = 'PHONE_ALREADY_EXISTS';
  static const invalidVerification = 'INVALID_VERIFICATION';
  static const expiredVerification = 'EXPIRED_VERIFICATION';
  static const userLocked = 'USER_LOCKED';
  static const invalidUserPassword = 'INVALID_USER_PASSWORD';
  static const locationExpired = 'LOCATION_EXPIRED';
  static const deviceNotRegistered = 'DEVICE_NOT_REGISTERED';
  static const requestVerifiedEmail = 'REQUIRE_VERIFIED_EMAIL';

  HandleNetworkError._();

  static void handleNetworkError(dynamic error, Function(String)? handler) {
    var appErrorMessage = '';

    if (error is AppError
        && error.errorType == AppErrorType.networkError) {
      switch (error.statusMessage) {
        case requestVerifiedEmail:

          break;
        case deviceNotRegistered:
          appErrorMessage = 'The device is unregistered';
        break;
        case locationExpired:
          appErrorMessage = 'Your access has expired. Please renew your subscription.';
        break;
        case invalidUserPassword:
          appErrorMessage = 'Invalid email or password';
        break;
        case userNotExists:
          appErrorMessage = 'Account does not exist, please check your email address';
          break;
        case countryNotExists:
          appErrorMessage = 'Invalid country';
          break;
        case weakPassword:
          appErrorMessage = 'Invalid password';
          break;
        case emailAlreadyExists:
          appErrorMessage = 'Email has already been registered by another account';
          break;
        case phoneAlreadyExists:
          appErrorMessage = 'Phone number has already been registered by another account';
          break;
        case invalidVerification:
          appErrorMessage = 'Invalid verification code';
          break;
        case expiredVerification:
          appErrorMessage = 'Expired verification code';
          break;
        case userLocked:
          appErrorMessage = 'Account has been locked';
          break;
        default:
          appErrorMessage = error.message;
          break;
      }

      handler?.call(appErrorMessage);
    }
  }
}