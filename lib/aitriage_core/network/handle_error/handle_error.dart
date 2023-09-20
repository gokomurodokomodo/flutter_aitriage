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
  static const existsPatientCode = 'EXISTS_PATIENT_CODE';
  static const invalidCountryStateCity = 'INVALID_COUNTRY_STATE_CITY';
  static const blankCountryCode = 'BLANK_COUNTRY_CODE';
  static const blankPatientCode = 'BLANK_PATIENT_CODE';
  static const blankPatientName = 'BLANK_PATIENT_NAME';
  static const blankPatientCountry = 'BLANK_PATIENT_COUNTRY';
  static const blankPatientState = 'BLANK_PATIENT_STATE';
  static const blankPatientCity = 'BLANK_PATIENT_CITY';
  static const blankPatientRace = 'BLANK_PATIENT_RACE';
  static const blankPatientBirthday = 'BLANK_PATIENT_BIRTHDAY';
  static const blankPatientGender = 'BLANK_PATIENT_GENDER';

  HandleNetworkError._();

  /// handlerStatusMessage(String, String, dynamic) -> new mappedStatusMessage, originStatusMessage, body
  static void handleNetworkError(
    dynamic error,
    Function(String, String, dynamic) handlerStatusMessage,
  ) {
    var appErrorMessage = '';

    if (error is AppError
        && error.errorType == AppErrorType.networkError) {
      switch (error.statusMessage) {
        case requestVerifiedEmail:
          appErrorMessage = error.body['data'];
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
        case existsPatientCode:
          appErrorMessage = 'MRN already exists';
          break;
        case invalidCountryStateCity:
          appErrorMessage = 'Invalid nationality, state or city';
          break;
        case blankCountryCode:
          appErrorMessage = 'The phone number is required';
          break;
        case blankPatientCode:
          appErrorMessage = 'MRN is required';
          break;
        case blankPatientName:
          appErrorMessage = 'Patient name is required';
          break;
        case blankPatientCountry:
          appErrorMessage = 'Nationality is required';
          break;
        case blankPatientState:
          appErrorMessage = 'State is required';
          break;
        case blankPatientCity:
          appErrorMessage = 'City is required';
          break;
        case blankPatientRace:
          appErrorMessage = 'Race is required';
          break;
        case blankPatientBirthday:
          appErrorMessage = 'Date of birth is required';
          break;
        case blankPatientGender:
          appErrorMessage = 'Gender is required';
          break;
        default:
          appErrorMessage = error.message;
          break;
      }

      handlerStatusMessage.call(appErrorMessage, error.statusMessage, error.body);
    }
  }
}