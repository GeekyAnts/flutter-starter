// routes for the app
import 'package:app/src/screens/home/index.dart';
import 'package:app/src/screens/onboarding/authentication_screen.dart';
import 'package:app/src/screens/products/add_product.dart';
import 'package:app/src/screens/products/product_details.dart';
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
    case '/addProduct':
      return MaterialPageRoute(builder: (_) => AddProduct());
    case '/productDetails':
      return MaterialPageRoute(builder: (_) => ProductDetails());
    default:
      return MaterialPageRoute(builder: (_) => SplashScreen());
  }
}
