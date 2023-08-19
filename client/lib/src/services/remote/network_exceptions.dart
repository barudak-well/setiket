// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@freezed
abstract class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorizedRequest(
      String reason, bool isUnauthorizedRequest) = UnauthorizedRequest;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError(String reason) =
      InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  const factory NetworkExceptions.unProcessableEntity(
    Map<String, dynamic> errors,
    String errorMessage,
  ) = UnProcessableEntity;

  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        late NetworkExceptions networkExceptions;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              networkExceptions = const NetworkExceptions.requestCancelled();
              break;
            case DioExceptionType.connectionTimeout:
              networkExceptions = const NetworkExceptions.requestTimeout();
              break;
            case DioExceptionType.unknown:
              networkExceptions =
                  const NetworkExceptions.noInternetConnection();
              break;
            case DioExceptionType.receiveTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioExceptionType.badCertificate:
              networkExceptions = const NetworkExceptions.unableToProcess();
              break;
            case DioExceptionType.connectionError:
              networkExceptions =
                  const NetworkExceptions.noInternetConnection();
              break;
            case DioExceptionType.badResponse:
              switch (error.response?.statusCode) {
                case 400:
                  networkExceptions = NetworkExceptions.unauthorizedRequest(
                    error.response?.data['body']['message'],
                    true,
                  );
                  break;
                case 401:
                  networkExceptions = NetworkExceptions.unauthorizedRequest(
                    error.response?.data['body']['message'],
                    true,
                  );
                  break;
                case 403:
                  networkExceptions = NetworkExceptions.unauthorizedRequest(
                    error.response?.data['body']['message'],
                    true,
                  );
                  break;
                case 404:
                  networkExceptions = NetworkExceptions.notFound(
                    error.response?.data['body']['message'],
                  );
                  break;
                case 408:
                  networkExceptions = const NetworkExceptions.requestTimeout();
                  break;
                case 409:
                  networkExceptions = const NetworkExceptions.conflict();
                  break;
                case 422:
                  networkExceptions = NetworkExceptions.unProcessableEntity(
                    error.response?.data['data'],
                    error.response?.data['body']['message'],
                  );
                  break;
                case 500:
                  networkExceptions = NetworkExceptions.internalServerError(
                    error.response?.data['body']['message'],
                  );
                  break;
                case 503:
                  networkExceptions =
                      const NetworkExceptions.serviceUnavailable();
                  break;
                default:
                  networkExceptions = NetworkExceptions.defaultError(
                    error.response?.data['body']['message'],
                  );
              }
              break;
            case DioExceptionType.sendTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException {
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(NetworkExceptions error) {
    var errorMessage = "";
    error.when(
      notImplemented: () {
        errorMessage = "Not Implemented";
      },
      requestCancelled: () {
        errorMessage = "Request Cancelled";
      },
      internalServerError: (String reason) {
        errorMessage = reason;
      },
      notFound: (String reason) {
        errorMessage = reason;
      },
      serviceUnavailable: () {
        errorMessage = "Service unavailable";
      },
      methodNotAllowed: () {
        errorMessage = "Method Allowed";
      },
      badRequest: () {
        errorMessage = "Bad request";
      },
      unauthorizedRequest: (String error, bool isUnauthorizedRequest) {
        errorMessage = error;
      },
      unexpectedError: () {
        errorMessage = "Unexpected error occurred";
      },
      requestTimeout: () {
        errorMessage = "Connection request timeout";
      },
      noInternetConnection: () {
        errorMessage = "No internet connection";
      },
      conflict: () {
        errorMessage = "Error due to a conflict";
      },
      sendTimeout: () {
        errorMessage = "Send timeout in connection with API server";
      },
      unableToProcess: () {
        errorMessage = "Unable to process the data";
      },
      defaultError: (String error) {
        errorMessage = error;
      },
      formatException: () {
        errorMessage = "Unexpected error occurred";
      },
      notAcceptable: () {
        errorMessage = "Not acceptable";
      },
      unProcessableEntity: (errors, error) {
        errorMessage = error;
      },
    );
    return errorMessage;
  }

  static Map<String, dynamic> getErrors(NetworkExceptions exceptions) {
    return exceptions.maybeWhen(
      unProcessableEntity: (error, message) {
        return error;
      },
      orElse: () {
        return {};
      },
    );
  }
}
