// routes for the app
import 'package:app/src/screens/home/index.dart';
import 'package:app/src/screens/onboarding/authentication_screen.dart';
import 'package:app/src/screens/templates/login/enter_number.dart';
import 'package:app/src/screens/templates/login/forgot_password.dart';
import 'package:app/src/screens/templates/login/login.dart';
import 'package:app/src/screens/templates/login/otp.dart';
import 'package:app/src/screens/templates/login/signup.dart';
import 'package:app/src/screens/templates/login/welcome.dart';
import 'package:app/src/screens/templates/news/newsletter.dart';
import 'package:app/src/screens/templates/news/view_newsletter.dart';
import 'package:app/src/screens/templates/profile/edit_profile.dart';
import 'package:app/src/screens/templates/profile/profile.dart';
import 'package:app/src/screens/templates/shopping/dashboard.dart';
import 'package:app/src/splash_screen.dart';
import 'package:flutter/material.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case '/home':
      return MaterialPageRoute(builder: (_) => HomeScreen());
    case '/auth':
      return MaterialPageRoute(builder: (_) => AuthenticationScreen());

    //Template Routes

    //Login
    case '/welcome':
      return MaterialPageRoute(builder: (_) => WelcomeScreen());
    case '/login':
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case '/signup':
      return MaterialPageRoute(builder: (_) => SignUp());
    case '/enter-number':
      return MaterialPageRoute(builder: (_) => EnterNumber());
    case '/otp':
      return MaterialPageRoute(builder: (_) => OTP());
    case '/forgot-password':
      return MaterialPageRoute(builder: (_) => ForgotPassword());

    //Profile
    case '/profile':
      return MaterialPageRoute(builder: (_) => ProfileScreen());
    case '/edit-profile':
      return MaterialPageRoute(builder: (_) => EditProfile());

    //News
    case '/newsletter':
      return MaterialPageRoute(builder: (_) => Newsletter());
    case '/view-newsletter':
      Map<String, dynamic> params = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (_) => ViewNews(
          id: params['id'],
          title: params['title'],
        ),
      );

    //Shopping Screens
    case '/dashboard':
      return MaterialPageRoute(builder: (_) => Dashboard());

    default:
      return MaterialPageRoute(builder: (_) => SplashScreen());
  }
}
