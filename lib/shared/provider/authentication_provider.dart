import 'package:shared_preferences/shared_preferences.dart';
import '../../flutter_starter.dart';

/// AuthenticationProvider is responsible for user login,
/// sign up, log out and fetching user data.
class AuthenticationProvider extends BaseProvider {
  String userSignupStatus = "user_signup_status";
  String userLoginStatus = "user_login_status";
  String userLogoutStatus = "user_logout_status";
  String fetchUserDataStatus = "fetch_user_data_status";
  late CurrentUserData? currentUserData;
  final AuthenticationRepository authenticationService =
      AuthenticationRepository();

  void userLogin(String email, String password) async {
    setStatus(userLoginStatus, Status.loading);
    final SharedPreferences sharedPreferences = await prefs;
    try {
      await Future.delayed(
          const Duration(milliseconds: 500)); // a simulated delay
      final data = await authenticationService.loginWithEmailAndPassword(
          email, password);
      if (data["error"] == null) {
        final currentUser = Token.fromJson(data);
        if (currentUser != null) {
          sharedPreferences.setString('authtoken', currentUser.token);
          setStatus(userLoginStatus, Status.done);
          setStatus(userLogoutStatus, Status.idle);
        } else {
          setStatus(userLoginStatus, Status.error);
          setError(userLoginStatus, "Invalid credentials");
        }
      } else {
        setError(userLoginStatus, data["error"]);
      }
    } catch (e) {
      setError(userLoginStatus, e.toString());
    }
  }

  void userSignup(String email, String password) async {
    setStatus(userSignupStatus, Status.loading);
    final SharedPreferences sharedPreferences = await prefs;
    try {
      await Future.delayed(
          const Duration(milliseconds: 500)); // a simulated delay
      final data = await authenticationService.signUpWithEmailAndPassword(
          email, password);

      if (data["error"] == null) {
        final currentUser = UserData.fromJson(data);
        if (currentUser != null) {
          sharedPreferences.setString('authtoken', currentUser.token);
          sharedPreferences.setInt('userId', currentUser.id);
          setStatus(userSignupStatus, Status.done);
          setStatus(userLogoutStatus, Status.idle);
        } else {
          setStatus(userSignupStatus, Status.error);
          setError(userSignupStatus, "Invalid credentials");
        }
      } else {
        setError(userSignupStatus, data["error"]);
      }
    } catch (e) {
      setError(userSignupStatus, e.toString());
    }
  }

  void userLogout() async {
    setStatus(userLogoutStatus, Status.loading);
    try {
      final SharedPreferences sharedPreferences = await prefs;
      await sharedPreferences.clear();
      currentUserData = null;
      setStatus(userLogoutStatus, Status.done);
      setStatus(userLoginStatus, Status.idle);
    } catch (e) {
      setStatus(userLogoutStatus, Status.error);
      setError(userLogoutStatus, e.toString());
    }
  }

  void getUserData() async {
    setStatus(fetchUserDataStatus, Status.loading);
    try {
      final SharedPreferences sharedPreferences = await prefs;
      final currentUserId = sharedPreferences.getInt('userId');
      final data = await authenticationService.getUserData(currentUserId ?? 4);
      currentUserData = CurrentUserData.fromJson(data);
      setStatus(fetchUserDataStatus, Status.done);
    } catch (e) {
      setStatus(fetchUserDataStatus, Status.error);
      setError(fetchUserDataStatus, e.toString());
    }
  }
}
