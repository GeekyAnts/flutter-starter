import 'package:dio/dio.dart';

import 'dio_helpers/dio_client.dart';
import 'dio_helpers/dio_interceptor.dart';

class DioApi {
  DioApi._internal();

  static final _singleton = DioApi._internal();

  factory DioApi() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      receiveTimeout: const Duration(milliseconds: 15000),
      connectTimeout: const Duration(milliseconds: 15000),
      sendTimeout: const Duration(milliseconds: 15000),
    ));

    dio.interceptors.addAll({
      DioInterceptor(),
    });
    return dio;
  }
}

class DioService {
  static getUserData(int id) async {
    final client = DioClient(DioApi.createDio());
    final response = await client.getUsers(id);
    return response;
  }

  static loginUser(dynamic body) async {
    final client = DioClient(DioApi.createDio());
    final response = await client.loginUser(body);
    return response;
  }

  static registerUser(dynamic body) async {
    final client = DioClient(DioApi.createDio());
    final response = await client.loginUser(body);
    return response;
  }
}
