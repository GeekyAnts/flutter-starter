import 'package:dio/dio.dart';
import 'package:flutter_starter/api_sdk/dio/models/user_model.dart';
import 'package:flutter_starter/flutter_starter.dart';

class DioApi {
  DioApi._internal();

  static final _singleton = DioApi._internal();

  factory DioApi() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      receiveTimeout: 15000,
      connectTimeout: 15000,
      sendTimeout: 15000,
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

  static postUserData(dynamic body) async {
    final client = DioClient(DioApi.createDio());
    final response = await client.createPost(body);
    return response;
  }
}
