import 'dart:io';

import 'package:dio/dio.dart';

AppException handleException(dynamic e) {
  if (e is DioException) {
    return _handleDioException(e);
  } else {
    print(e.toString());
    return AppException.unknown(
      exception: e is Exception ? e : Exception('Unknown exception occurred'),
      message: "UnKnow Error!",
    );
  }
}

AppException _handleDioException(DioException exception) {
  if (exception.response?.statusCode.toString().matchAsPrefix('5') != null) {
    return AppNetworkException(
        reason: AppNetworkExceptionReason.serverError, exception: exception);
  }
  switch (exception.type) {
    case DioExceptionType.cancel:
      return AppNetworkException(
        reason: AppNetworkExceptionReason.canceled,
        exception: exception,
      );
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
      return AppNetworkException(
          reason: AppNetworkExceptionReason.timedOut, exception: exception);
    case DioExceptionType.badResponse:
      // For DioErrorType.response, we are guaranteed to have a
      // response object present on the exception.
      final response = exception.response;
      if (response == null) {
        // This should never happen, judging by the current source code
        // for Dio.
        return AppNetworkResponseException(exception: exception);
      }

      return AppNetworkResponseException(
        exception: exception,
        statusCode: response.statusCode,
        data: response.data,
      );
    case DioExceptionType.unknown:
    default:
      if (exception.error is SocketException) {
        return AppNetworkException(
            reason: AppNetworkExceptionReason.noInternet, exception: exception);
      }
      return AppException.unknown(
          exception: exception,
          message: exception.response == null
              ? ((exception.error ?? "").toString())
              : exception.response?.data['message']);
  }
}

class AppException<OriginalException> implements Exception {
  const AppException({required this.message, required this.exception});

  const AppException.unknown({required this.exception, required this.message});

  final OriginalException exception;
  final String message;

  AppException copyWith({
    OriginalException? exception,
    String? message,
  }) {
    return AppException(
      exception: exception ?? this.exception,
      message: message ?? this.message,
    );
  }
}

enum AppNetworkExceptionReason {
  canceled,
  timedOut,
  responseError,
  noInternet,
  serverError
}

extension AppNetworkExceptionReasonExt on AppNetworkExceptionReason {
  String get message {
    switch (this) {
      case AppNetworkExceptionReason.canceled:
        return 'Request canceled!';
      case AppNetworkExceptionReason.timedOut:
        return 'Request timed out!';
      case AppNetworkExceptionReason.responseError:
        return 'Server response error!';
      case AppNetworkExceptionReason.noInternet:
        return 'No internet connection';
      case AppNetworkExceptionReason.serverError:
        return 'Server  error!';
    }
  }
}

class AppNetworkException<OriginalException extends Exception>
    extends AppException<OriginalException> {
  /// Create a network exception.
  AppNetworkException({
    required this.reason,
    required OriginalException exception,
    String? message,
  }) : super(exception: exception, message: message ?? reason.name);

  AppNetworkException._({
    required this.reason,
    required OriginalException exception,
    required String message,
  }) : super(exception: exception, message: message);

  /// The reason the network exception occurred.
  final AppNetworkExceptionReason reason;

  @override
  AppNetworkException copyWith(
      {OriginalException? exception, String? message}) {
    return AppNetworkException._(
        reason: reason,
        exception: exception ?? this.exception,
        message: message ?? this.message);
  }
}

class AppNetworkResponseException<OriginalException extends Exception, DataType>
    extends AppNetworkException<OriginalException> {
  AppNetworkResponseException(
      {required OriginalException exception,
      this.statusCode,
      this.data,
      String? message})
      : super(
            reason: AppNetworkExceptionReason.responseError,
            exception: exception,
            message: message);

  final DataType? data;
  final int? statusCode;

  bool get hasData => data != null;

  /// If the status code is null, returns false. Otherwise, allows the
  /// given closure [evaluator] to validate the given http integer status code.
  ///
  /// Usage:
  /// ```
  /// final isValid = responseException.validateStatusCode(
  ///   (statusCode) => statusCode >= 200 && statusCode < 300,
  /// );
  /// ```
  bool validateStatusCode(bool Function(int statusCode) evaluator) {
    final statusCode = this.statusCode;
    if (statusCode == null) return false;
    return evaluator(statusCode);
  }
}

extension AppExceptionExt on AppException {
  bool get noInternetConnection => isThis(AppNetworkExceptionReason.noInternet);

  bool isThis(AppNetworkExceptionReason reason) {
    if (this is AppNetworkException<dynamic>) {
      final e = this as AppNetworkException;
      return e.reason == reason;
    }
    return false;
  }
}
