import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_export.dart';

enum AuthMode {
  authenticationLoading,
  authenticationStart,
  appAutheticated,
  userLogoutState,
  authenticationFailure,
}

final authProvider = StateNotifierProvider<AuthProvider, AuthMode>((ref) {
  final repository = ref.watch(repoProvider);
  return AuthProvider(repository);
});

class AuthProvider extends StateNotifier<AuthMode> {
  AuthProvider(this.repository) : super(AuthMode.authenticationLoading);
  AuthenticationRepository repository;
  final SharedPrefs prefs = SharedPrefs.instance;

  appLoadedup() async {
    state = AuthMode.authenticationLoading;
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      if (prefs.getToken() != null) {
        state = AuthMode.appAutheticated;
      } else {
        state = AuthMode.authenticationStart;
      }
    } catch (e) {
      state = AuthMode.authenticationFailure;
    }
  }

  userLogin(email, password) async {
    state = AuthMode.authenticationLoading;
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final data = await repository.loginWithEmailAndPassword(email, password!);
      if (data["error"] == null) {
        final currentUser = Token.fromJson(data);
        prefs.setToken(currentUser.token);
        state = AuthMode.appAutheticated;
      } else {
        state = AuthMode.authenticationFailure;
      }
    } catch (e) {
      state = AuthMode.authenticationFailure;
    }
  }

  userSignup(email, password) async {
    state = AuthMode.authenticationLoading;
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final data =
          await repository.signUpWithEmailAndPassword(email, password!);
      if (data["error"] == null) {
        final currentUser = UserData.fromJson(data);
        prefs.setToken(currentUser.token);
        prefs.setUserId(currentUser.id);
        state = AuthMode.appAutheticated;
      } else {
        state = AuthMode.authenticationFailure;
      }
    } catch (e) {
      state = AuthMode.authenticationFailure;
    }
  }

  userLogout() {
    state = AuthMode.authenticationLoading;
    prefs.clear();
    state = AuthMode.userLogoutState;
  }
}
