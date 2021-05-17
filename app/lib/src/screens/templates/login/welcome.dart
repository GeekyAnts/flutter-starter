import 'package:app/src/config/image_constants.dart';
import 'package:app/src/widgets/cache_image_widget.dart';
import 'package:app/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:app/src/utils/size_utils.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedImage(
              imageUrl: "https://theuniqueacademy.co.in/assets/images/test.png",
              fit: BoxFit.fitWidth,
              errorWidget: Image.network(
                AllImages().kDefaultImage,
              ),
              width: 500,
              height: 250,
              placeholder: CircularProgressIndicator(),
            ),
            SizedBox(
              height: 20.toHeight,
            ),
            Text(
              "Welcome to Flutter Starter",
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 20.toHeight,
            ),
            Text(
              "A Flutter starter-kit for production-level apps",
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 30.toHeight,
            ),
            CustomButton(
              onTap: () => Navigator.pushNamed(context, '/login'),
              text: "Login Now",
              isSecondary: false,
            ),
            SizedBox(
              height: 14.toHeight,
            ),
            CustomButton(
              onTap: () => Navigator.pushNamed(context, '/signup'),
              text: "Create Account",
              isSecondary: true,
            ),
          ],
        ),
      ),
    );
  }
}
