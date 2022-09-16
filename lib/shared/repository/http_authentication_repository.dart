import 'package:flutter_starter/flutter_starter.dart';

class AuthenticationRepository {
  Future<dynamic> signUpWithEmailAndPassword(
      String email, String password) async {
    await Future.delayed(
        const Duration(seconds: 1)); // simulate a network delay
    final response = await ApiSdk.signUpWithEmailAndPassword(
        {'email': email, 'password': password});

    return response;
  }

  Future<dynamic> loginWithEmailAndPassword(
      String email, String password) async {
    await Future.delayed(
        const Duration(seconds: 1)); // simulate a network delay
    final response = await ApiSdk.loginWithEmailAndPassword(
        {'email': email, 'password': password});

    return response;
  }

  Future<dynamic> getUserData(int id) async {
    final response = await ApiSdk.getUserData(id);

    return response;
  }
}
