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
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // Do something with the response error.
    _handleError(err);
    super.onError(err, handler);
  }

  _handleError(DioError err) {
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        throw TimeOutException(err.message, err.requestOptions);
      case DioErrorType.response:
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
      case DioErrorType.other:
        throw ConnectionException(
          'Please check your network connection',
          err.requestOptions,
        );
      default:
        throw err;
    }
  }
}
