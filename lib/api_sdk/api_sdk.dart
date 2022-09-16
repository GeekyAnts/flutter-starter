import 'package:flutter_starter/api_sdk/dio/dio_service.dart';
import 'package:flutter_starter/flutter_starter.dart';

import 'http/http_helpers/http_apis.dart';

// example network calls made from app

/// This file can be omitted and Service can directly use at repository level
class ApiSdk {
  // Http Service
  static loginWithEmailAndPassword(dynamic body) async {
    final response = await HttpService.postData(HttpApis.login, body);
    return response;
  }

  // Http Service
  static signUpWithEmailAndPassword(dynamic body) async {
    final response = await HttpService.postData(HttpApis.register, body);
    return response;
  }

  // Http Service
  static getUserData(int id) async {
    final response = await HttpService.getData(HttpApis.users(id));
    return response;
  }

  // Dio Service
  static getUserDataDio(int id) async {
    final response = await DioService.getUserData(id);
    return response;
  }

  // Dio Service
  static postUserDataDio(dynamic body) async {
    final response = await DioService.postUserData(body);
    return response;
  }
}
