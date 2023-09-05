enum AppErrorType { networkError, unknown }

class AppError {
  final AppErrorType errorType;
  final int statusCode;
  final String message;
  final String statusMessage;
  final dynamic body;

  AppError({
    required this.errorType,
    this.statusCode = 0,
    this.message = '',
    this.statusMessage = '',
    this.body
  });
}