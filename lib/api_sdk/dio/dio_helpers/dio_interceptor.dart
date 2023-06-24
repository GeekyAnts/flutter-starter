import 'package:dio/dio.dart';

import 'dio_exceptions.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Do something before request is sent.
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Do something with the response data.
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Do something with the response error.
    _handleError(err);
    super.onError(err, handler);
  }

  _handleError(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        throw TimeOutException(err.message.toString(), err.requestOptions);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(
              err.error.toString(),
              err.requestOptions,
            );
          case 401:
            throw UnauthorisedException(
              err.error.toString(),
              err.requestOptions,
            );
          case 403:
            throw UnauthorisedException(
              err.error.toString(),
              err.requestOptions,
            );
          case 404:
            throw FileNotFoundException(
              err.error.toString(),
              err.requestOptions,
            );
          case 500:
            throw InternalServerException(
              err.error.toString(),
              err.requestOptions,
            );
          case 502:
            throw BadGateWayException(
              err.error.toString(),
              err.requestOptions,
            );
          case 503:
            throw BadGateWayException(
              err.error.toString(),
              err.requestOptions,
            );
        }
        break;
      case DioExceptionType.unknown:
        throw ConnectionException(
          'Please check your network connection',
          err.requestOptions,
        );
      default:
        throw err;
    }
  }
}
