import 'package:api_sdk/firebase_method/auth_services/firebase_auth.dart';

class AuthenticationRepository {
  AuthService _auth = AuthService();
  Future<dynamic> signUpWithEmailAndPassword(
      String email, String password) async {
    await Future.delayed(Duration(seconds: 1)); // simulate a network delay
    final response = await _auth.registerWithEmailAndPassword(email, password);
    return response;
  }

  Future<dynamic> loginWithEmailAndPassword(
      String email, String password) async {
    await Future.delayed(Duration(seconds: 1)); // simulate a network delay
    final response = await _auth.signInWithEmailAndPassword(email, password);
    return response;
  }

  Future<dynamic> getUserData() async {
    await Future.delayed(Duration(seconds: 1)); // simulate a network delay
    final response = await _auth.getCurrentUser();
    return response;
  }

  void logout() async {
    _auth.signOut();
  }
}
