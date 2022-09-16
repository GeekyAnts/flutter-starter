import 'package:flutter_starter/flutter_starter.dart';

class AuthenticationBlocController {
  AuthenticationBlocController._();
  static final AuthenticationBlocController _instance =
      AuthenticationBlocController._();
  factory AuthenticationBlocController() => _instance;

  // ignore: close_sinks
  AuthenticationBloc authenticationBloc = AuthenticationBloc();
}
