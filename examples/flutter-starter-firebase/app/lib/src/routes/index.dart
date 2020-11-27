// routes for the app
import 'package:app/src/screens/home/index.dart';
import 'package:app/src/screens/onboarding/authentication_screen.dart';
import 'package:app/src/screens/bookstore/add_books.dart';
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
    case '/addBooks':
      return MaterialPageRoute(builder: (_) => AddBooks());
    default:
      return MaterialPageRoute(builder: (_) => SplashScreen());
  }
}
