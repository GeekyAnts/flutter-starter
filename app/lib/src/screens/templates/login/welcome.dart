import 'package:app/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:app/src/utils/size_utils.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://flutter-starter.geekyants.com/img/fs-logo.png',
                  width: 70,
                ),
                Text(
                  "Flutter Starter",
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      .copyWith(color: Colors.white),
                )
              ],
            ),
            Spacer(flex: 1),
            CustomButton(
              onTap: () => Navigator.pushNamed(context, '/signup'),
              text: "Sign Up",
              isSecondary: false,
            ),
            SizedBox(
              height: 20.toHeight,
            ),
            CustomButton(
              onTap: () => Navigator.pushNamed(context, '/login'),
              text: "Login",
              isSecondary: true,
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
