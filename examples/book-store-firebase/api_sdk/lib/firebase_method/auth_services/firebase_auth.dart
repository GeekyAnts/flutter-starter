import 'package:api_sdk/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String errorMessage;

  //Create User Object from Firebase User
  Future getCurrentUser() async {
    try {
      final User user = _auth.currentUser;
      if (user != null) {
        String token = await user.getIdToken();
        return _userFromFirebaseUser(user, token);
      } else {
        return null;
      }
    } catch (err) {
      errorMessage = getMessageFromErrorCode(err.code);
      print(errorMessage);
      return Future.error(errorMessage);
    }
  }

  //Signin With email and password
  String getMessageFromErrorCode(errorCode) {
    switch (errorCode) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email already used. Go to login page.";
        break;
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return "Wrong email/password combination.";
        break;
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "No user found with this email. Please signUp to continue";
        break;
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return "User disabled.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return "Too many requests to log into this account.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        return "Server error, please try again later.";
        break;
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Email address is invalid.";
        break;
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "No account found with this email";
        break;
      default:
        return "Login failed. Please try again.";
        break;
    }
  }

  //Register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      String token = await userCredential.user.getIdToken();
      return _userFromFirebaseUser(userCredential.user, token);
    } catch (err) {
      errorMessage = getMessageFromErrorCode(err.code);
      print(errorMessage);
      return Future.error(errorMessage);
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      String token = await userCredential.user.getIdToken();
      return _userFromFirebaseUser(userCredential.user, token);
    } catch (err) {
      errorMessage = getMessageFromErrorCode(err.code);
      print(errorMessage);
      return Future.error(errorMessage);
    }
  }

  //signout
  Future<void> signOut() async {
    return await _auth.signOut();
  }

  //getMessageFromErrorCode
  MyUser _userFromFirebaseUser(User user, token) {
    return user != null
        ? MyUser(uid: user.uid, email: user.email, token: token)
        : null;
  }
}
