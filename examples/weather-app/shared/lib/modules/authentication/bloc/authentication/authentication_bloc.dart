import 'package:bloc/bloc.dart';
import 'package:shared/main.dart';
import 'package:shared/modules/authentication/models/current_user_data.dart';

import 'package:shared/modules/authentication/resources/authentication_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'authentication_bloc_public.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial());
  final AuthenticationRepository authenticationService =
      AuthenticationRepository();
  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    final SharedPreferences sharedPreferences = await prefs;
    if (event is AppLoadedup) {
      yield* _mapAppSignUpLoadedState(event);
    }

    if (event is UserSignUp) {
      yield* _mapUserSignupToState(event);
    }

    if (event is UserLogin) {
      yield* _mapUserLoginState(event);
    }
    if (event is UserLogOut) {
      sharedPreferences.setString('authtoken', null);
      sharedPreferences.setInt('userId', null);
      yield UserLogoutState();
    }
    if (event is GetUserData) {
      int currentUserId = sharedPreferences.getInt('userId');
      final data = await authenticationService.getUserData(currentUserId ?? 4);
      final currentUserData = CurrentUserData.fromJson(data);
      yield SetUserData(currentUserData: currentUserData);
    }
  }

  Stream<AuthenticationState> _mapAppSignUpLoadedState(
      AppLoadedup event) async* {
    yield AuthenticationLoading();
    try {
      await Future.delayed(Duration(milliseconds: 500)); // a simulated delay
      final SharedPreferences sharedPreferences = await prefs;
      if (sharedPreferences.getString('authtoken') != null) {
        yield AppAutheticated();
      } else {
        yield AuthenticationStart();
      }
    } catch (e) {
      yield AuthenticationFailure(
          message: e.message ?? 'An unknown error occurred');
    }
  }

  Stream<AuthenticationState> _mapUserSignupToState(UserSignUp event) async* {
    final SharedPreferences sharedPreferences = await prefs;
    yield AuthenticationLoading();
    try {
      await Future.delayed(Duration(milliseconds: 500)); // a simulated delay
      final data = await authenticationService.signUpWithEmailAndPassword(
          event.email, event.password);

      if (data["error"] == null) {
        final currentUser = UserData.fromJson(data);
        if (currentUser != null) {
          sharedPreferences.setString('authtoken', currentUser.token);
          sharedPreferences.setInt('userId', currentUser.id);
          yield AppAutheticated();
        } else {
          yield AuthenticationNotAuthenticated();
        }
      } else {
        yield AuthenticationFailure(message: data["error"]);
      }
    } catch (e) {
      yield AuthenticationFailure(
          message: e.toString() ?? 'An unknown error occurred');
    }
  }

  Stream<AuthenticationState> _mapUserLoginState(UserLogin event) async* {
    final SharedPreferences sharedPreferences = await prefs;
    yield AuthenticationLoading();
    try {
      await Future.delayed(Duration(milliseconds: 500)); // a simulated delay
      final data = await authenticationService.loginWithEmailAndPassword(
          event.email, event.password);
      if (data["error"] == null) {
        final currentUser = Token.fromJson(data);
        if (currentUser != null) {
          sharedPreferences.setString('authtoken', currentUser.token);
          yield AppAutheticated();
        } else {
          yield AuthenticationNotAuthenticated();
        }
      } else {
        yield AuthenticationFailure(message: data["error"]);
      }
    } catch (e) {
      yield AuthenticationFailure(
          message: e.toString() ?? 'An unknown error occurred');
    }
  }
}
