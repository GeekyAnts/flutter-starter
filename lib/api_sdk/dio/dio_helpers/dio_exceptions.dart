import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  final String message;
  final RequestOptions requestOptions;

  DioExceptions({required this.message, required this.requestOptions});
}

class TimeOutException extends DioExceptions {
  TimeOutException(String message, RequestOptions requestOptions)
      : super(message: message, requestOptions: requestOptions);
}

class BadRequestException extends DioExceptions {
  BadRequestException(String message, RequestOptions requestOptions)
      : super(message: message, requestOptions: requestOptions);
}

class UnauthorisedException extends DioExceptions {
  UnauthorisedException(String message, RequestOptions requestOptions)
      : super(message: message, requestOptions: requestOptions);
}

class FileNotFoundException extends DioExceptions {
  FileNotFoundException(String message, RequestOptions requestOptions)
      : super(message: message, requestOptions: requestOptions);
}

class InternalServerException extends DioExceptions {
  InternalServerException(String message, RequestOptions requestOptions)
      : super(message: message, requestOptions: requestOptions);
}

class BadGateWayException extends DioExceptions {
  BadGateWayException(String message, RequestOptions requestOptions)
      : super(message: message, requestOptions: requestOptions);
}

class ConnectionException extends DioExceptions {
  ConnectionException(String message, RequestOptions requestOptions)
      : super(message: message, requestOptions: requestOptions);
}
