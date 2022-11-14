import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common_export.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpScreen();
      },
    ),
  ],
);

/// routes for the app  Without go_router
// import 'package:flutter_starter/flutter_starter.dart';

// import 'package:flutter/material.dart';

// Route routes(RouteSettings settings) {
//   switch (settings.name) {
//     case '/':
//       return MaterialPageRoute(builder: (_) => const SplashScreen());
//     case '/home':
//       return MaterialPageRoute(builder: (_) => const HomeScreen());
//     case '/auth':
//       return MaterialPageRoute(builder: (_) => const AuthenticationScreen());
//     default:
//       return MaterialPageRoute(builder: (_) => const SplashScreen());
//   }
// }
