// routes for the app

import 'package:app/src/screens/home/index.dart';
import 'package:app/src/screens/onboarding/authentication_screen.dart';
import 'package:app/src/screens/templates/chat/chats.dart';
import 'package:app/src/screens/templates/chat/messages.dart';
import 'package:app/src/screens/templates/delivery/bag.dart';
import 'package:app/src/screens/templates/delivery/dashboard.dart';
import 'package:app/src/screens/templates/delivery/product.dart';
import 'package:app/src/screens/templates/login/enter_number.dart';
import 'package:app/src/screens/templates/login/forgot_password.dart';
import 'package:app/src/screens/templates/login/login.dart';
import 'package:app/src/screens/templates/login/otp.dart';
import 'package:app/src/screens/templates/login/signup.dart';
import 'package:app/src/screens/templates/login/welcome.dart';
import 'package:app/src/screens/templates/news/news.dart';
import 'package:app/src/screens/templates/news/view_news.dart';
import 'package:app/src/screens/templates/payment/payments.dart';
import 'package:app/src/screens/templates/profile/edit_profile.dart';
import 'package:app/src/screens/templates/profile/profile.dart';
import 'package:app/src/screens/templates/side_drawer/side_drawer.dart';
import 'package:app/src/screens/templates/templates_home.dart';
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

    //Template Home
    case '/templates-home':
      return MaterialPageRoute(builder: (_) => TemplatesHome());

    //Side Drawer
    case '/side-drawer':
      return MaterialPageRoute(builder: (_) => SideDrawer());

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
    case '/news':
      return MaterialPageRoute(builder: (_) => News());
    case '/view-news':
      Map<String, dynamic> params = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (_) => ViewNews(
          id: params['id'],
          title: params['title'],
        ),
      );

    //Shopping Screens
    case '/delivery':
      return MaterialPageRoute(builder: (_) => DeliveryDashboard());
    case '/product':
      Map<String, dynamic> params = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (_) => Product(
          id: params['id'],
          name: params['name'],
          image: params['image'],
        ),
      );
    case '/bag':
      Map<String, dynamic> params = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (_) => Bag(
          id: params['id'],
          name: params['name'],
          image: params['image'],
        ),
      );

    //Payment
    case '/payment':
      return MaterialPageRoute(builder: (_) => Payments());

    //Chat App
    case '/chat':
      return MaterialPageRoute(builder: (_) => Chats());
    case '/messages':
      Map<String, dynamic> params = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
          builder: (_) => Messages(
                chat: params['chat'],
              ));

    default:
      return MaterialPageRoute(builder: (_) => SplashScreen());
  }
}
