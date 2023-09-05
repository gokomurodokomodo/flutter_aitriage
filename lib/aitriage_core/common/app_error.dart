enum AppErrorType { networkError, unknown }

class AppError {
  final AppErrorType errorType;
  final int statusCode;
  final String message;
  final dynamic body;

  AppError({
    required this.errorType,
    this.statusCode = 0,
    this.message = '',
    this.body
  });
}