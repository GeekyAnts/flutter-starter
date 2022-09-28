import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/flutter_starter.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SharedPrefs prefs = SharedPrefs.instance;
  final AuthenticationRepository _authenticationService;

  AuthenticationBloc({
    required AuthenticationRepository authenticationService,
  })  : _authenticationService = authenticationService,
        super(const AuthenticationInitial()) {
    on<AppLoadedup>(_mapAppSignUpLoadedState);
    on<UserSignUp>(_mapUserSignupToState);
    on<UserLogin>(_mapUserLoginState);
    on<UserLogOut>(_mapUserLogoutState);
    on<GetUserData>(_mapUserDataState);
  }

  void _mapAppSignUpLoadedState(
      AppLoadedup event, Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationLoading());
    try {
      await Future.delayed(
          const Duration(milliseconds: 500)); // a simulated delay
      if (prefs.getToken() != null) {
        emit(const AppAutheticated());
      } else {
        emit(const AuthenticationStart());
      }
    } catch (e) {
      emit(const AuthenticationFailure(message: 'An unknown error occurred'));
    }
  }

  void _mapUserLoginState(
      UserLogin event, Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationLoading());
    try {
      await Future.delayed(
          const Duration(milliseconds: 500)); // a simulated delay
      final data = await _authenticationService.loginWithEmailAndPassword(
          event.email, event.password!);
      if (data["error"] == null) {
        final currentUser = Token.fromJson(data);
        if (currentUser != null) {
          prefs.setToken(currentUser.token);
          emit(const AppAutheticated());
        } else {
          emit(AuthenticationNotAuthenticated());
        }
      } else {
        emit(AuthenticationFailure(message: data["error"]));
      }
    } catch (e) {
      emit(AuthenticationFailure(message: e.toString()));
    }
  }

  void _mapUserSignupToState(
      UserSignUp event, Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationLoading());
    try {
      await Future.delayed(
          const Duration(milliseconds: 500)); // a simulated delay
      final data = await _authenticationService.signUpWithEmailAndPassword(
          event.email, event.password!);

      if (data["error"] == null) {
        final currentUser = UserData.fromJson(data);
        if (currentUser != null) {
          prefs.setToken(currentUser.token);
          prefs.setUserId(currentUser.id);
          emit(const AppAutheticated());
        } else {
          emit(AuthenticationNotAuthenticated());
        }
      } else {
        emit(AuthenticationFailure(message: data["error"]));
      }
    } catch (e) {
      emit(AuthenticationFailure(message: e.toString()));
    }
  }

  void _mapUserLogoutState(
      UserLogOut event, Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationLoading());
    prefs.clear();
    emit(const UserLogoutState());
  }

  void _mapUserDataState(
      GetUserData event, Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationLoading());
    final currentUserId = prefs.getUserId();
    final data = await _authenticationService.getUserData(currentUserId ?? 4);
    final currentUserData = CurrentUserData.fromJson(data);
    emit(SetUserData(currentUserData: currentUserData));
  }
}
