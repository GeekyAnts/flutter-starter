import 'package:flutter_starter/api_sdk/dio/dio_service.dart';
import 'package:flutter_starter/api_sdk/dio/models/user_model.dart';

class DioAuthenticationRepository {
  Future<DioResponseData> getUserData(int id) async {
    final response = await DioService.getUserData(id);

    return response;
  }
}
