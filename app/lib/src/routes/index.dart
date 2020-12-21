// routes for the app
import 'package:app/src/screens/home/index.dart';
import 'package:app/src/screens/onboarding/authentication_screen.dart';
import 'package:app/src/splash_screen.dart';
import 'package:flutter/material.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (_) => SplashScreen(),
        settings:
            RouteSettings(name: settings.name, arguments: settings.arguments),
      );
    case '/home':
      return MaterialPageRoute(
        builder: (_) => HomeScreen(),
        settings:
            RouteSettings(name: settings.name, arguments: settings.arguments),
      );
    case '/auth':
      return MaterialPageRoute(
        builder: (_) => AuthenticationScreen(),
        settings:
            RouteSettings(name: settings.name, arguments: settings.arguments),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => SplashScreen(),
        settings:
            RouteSettings(name: settings.name, arguments: settings.arguments),
      );
  }
}
