import 'package:bloc/bloc.dart';
import 'package:shared/main.dart';
import 'package:shared/modules/authentication/resources/authentication_repository.dart';
import 'authentication_bloc_public.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial());
  final AuthenticationRepository authenticationService =
      AuthenticationRepository();
  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
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
      authenticationService.logout();
      yield UserLogoutState();
    }
    if (event is GetUserData) {
      final firebaseUser = await authenticationService.getUserData();
      if (firebaseUser != null)
        yield SetUserData(
            email: firebaseUser.email, avatar: firebaseUser.avatar);
      else
        yield AuthenticationStart();
    }
  }

  Stream<AuthenticationState> _mapAppSignUpLoadedState(
      AppLoadedup event) async* {
    yield AuthenticationLoading();
    try {
      await Future.delayed(Duration(milliseconds: 500)); // a simulated delay
      final firebaseUser = await authenticationService.getUserData();
      if (firebaseUser != null) {
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
    yield AuthenticationLoading();
    try {
      await Future.delayed(Duration(milliseconds: 500)); // a simulated delay
      final firebaseUser = await authenticationService
          .signUpWithEmailAndPassword(event.email, event.password);
      if (firebaseUser != null) {
        yield AppAutheticated();
      }
    } catch (e) {
      yield AuthenticationFailure(
          message: e.toString() ?? 'An unknown error occurred');
    }
  }

  Stream<AuthenticationState> _mapUserLoginState(UserLogin event) async* {
    yield AuthenticationLoading();
    try {
      await Future.delayed(Duration(milliseconds: 500)); // a simulated delay
      final firebaseUser = await authenticationService
          .loginWithEmailAndPassword(event.email, event.password);
      if (firebaseUser != null) {
        yield AppAutheticated();
      }
    } catch (e) {
      yield AuthenticationFailure(
          message: e.toString() ?? 'An unknown error occurred');
    }
  }
}
