import 'dart:io';

import 'package:dio/dio.dart';
import 'package:waffarha_challenge/app/data/api_manager/models/models.dart';
import 'package:waffarha_challenge/app/data/api_manager/status_checker/http_codes.dart';
import 'package:waffarha_challenge/app/data/api_manager/status_checker/status_checker.dart';

class FailureHandler {
  FailureHandler();
  final StatusChecker _statusChecker = StatusChecker();

  // ignore: long-method
  Failure handle({
    Request? request,
    // ignore: avoid_annotating_with_dynamic
    dynamic exception,
    Response<dynamic>? response,
  }) {
    final failureInfo = FailureInfo(
      request: request,
      exception: exception,
      response: response,
    );
    Failure? failure;
    if (exception is ErrorException) {
      failure = ErrorFailure(
        errorStatus: _statusChecker.getErrorState(exception.statusCode),
        error: exception.error,
      );
    } else if (exception is DioException) {
      switch (exception.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionError:
          failure = ConnectionFailure();
        case DioExceptionType.cancel:
          failure = RequestCanceledFailure();
        case DioExceptionType.badResponse:
        case DioExceptionType.badCertificate:
        case DioExceptionType.unknown:
          {
            if (exception.message != null) {
              final socketException =
                  exception.message!.contains('SocketException');
              final getRequest = request?.method == 'GET';
              final httpException =
                  exception.message!.contains('HttpException') ||
                      exception.message!.contains('Connection');
              failure = socketException || (httpException && getRequest)
                  ? ConnectionFailure()
                  : UnknownFailure(failureInfo);
            }
            failure = UnknownFailure(failureInfo);
          }
      }
    } else if (exception is ServerException) {
      final status = _statusChecker(exception.response?.statusCode);
      switch (status) {
        case HTTPCodes.invalidToken:
          failure = SessionEndedFailure();
        case HTTPCodes.serviceNotAvailable:
          failure = ServiceNotAvailableFailure(failureInfo);
        case HTTPCodes.unknown:
          failure = UnknownFailure(failureInfo);
        case HTTPCodes.success:
        case HTTPCodes.error:
          break;
      }
    } else if (exception is SocketException) {
      failure = ConnectionFailure();
    } else if (exception is FormatException ||
        exception is RangeError ||
        exception is TypeError ||
        exception is NoSuchMethodError) {
      failure = TypeFailure(failureInfo);
    } else if (exception is ValidationException) {
      failure = ValidationFailure(exception.value);
    }

    return failure ?? UnknownFailure(failureInfo);
  }
}
