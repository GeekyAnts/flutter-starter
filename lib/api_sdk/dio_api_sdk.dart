import 'dio/dio_service.dart';

class ApiSdk {
  static loginWithEmailAndPassword(dynamic body) async {
    final response = await DioService.loginUser(body);
    return response;
  }

  static signUpWithEmailAndPassword(dynamic body) async {
    final response = await DioService.registerUser(body);
    return response;
  }

  static getUserData(int id) async {
    final response = await DioService.getUserData(id);
    return response;
  }
}
