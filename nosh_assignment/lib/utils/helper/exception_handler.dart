import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../app/data/value/strings.dart';

class APIException implements Exception {
  final String message;

  APIException({required this.message});
}

class ExceptionHandler {
  ExceptionHandler._privateConstructor();

  static APIException handleError(Exception error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.sendTimeout:
          return APIException(message: ErrorMessages.noInternet);
        case DioExceptionType.connectionTimeout:
          return APIException(message: ErrorMessages.connectionTimeout);
        case DioExceptionType.badResponse:
          if (kDebugMode) {
            print(error.error);
          }
          return APIException(
              message:  ErrorMessages.networkGeneral);
        default:
          return APIException(message:  ErrorMessages.networkGeneral);
      }
    } else {
      return APIException(message: ErrorMessages.networkError);
    }
  }
}

