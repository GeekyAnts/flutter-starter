import 'package:app/src/config/image_constants.dart';
import 'package:app/src/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:app/src/utils/size_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.west),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: double.infinity,
                      color: Theme.of(context).accentColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.toWidth,
                        vertical: 30.toHeight,
                      ),
                      child: Text(
                        "Sign up",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 31.toFont),
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            color: Theme.of(context).accentColor,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30.toWidth,
                              vertical: 40.toHeight,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome",
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                SizedBox(
                                  height: 13.toHeight,
                                ),
                                Text(
                                  "Fill in the form to create an account !",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 40.toHeight,
                                ),
                                TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  autofocus: true,
                                  autocorrect: false,
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    labelText: 'Email ID',
                                    filled: false,
                                  ),
                                ),
                                SizedBox(height: 25.toHeight),
                                TextField(
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  autofocus: true,
                                  autocorrect: false,
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    labelText: 'Password',
                                    filled: false,
                                  ),
                                ),
                                SizedBox(height: 25.toHeight),
                                TextField(
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  autofocus: true,
                                  autocorrect: false,
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    labelText: 'Confirm Password',
                                    filled: false,
                                  ),
                                ),
                                SizedBox(height: 15.toHeight),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                        width: 10,
                                        child: Theme(
                                          data: ThemeData(
                                            unselectedWidgetColor:
                                                Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.75),
                                          ),
                                          child: Checkbox(
                                              checkColor: Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.75),
                                              activeColor: Colors.white,
                                              value: check,
                                              onChanged: (value) {
                                                setState(() {
                                                  check = value;
                                                });
                                              }),
                                        ),
                                      ),
                                      SizedBox(width: 20.toWidth),
                                      RichText(
                                        text: TextSpan(
                                          text: "I accept the ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2
                                              .copyWith(
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey[600],
                                                fontSize: 22.toFont,
                                              ),
                                          children: [
                                            TextSpan(
                                              text:
                                                  "Terms of Use & Privacy Policy.",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2
                                                  .copyWith(
                                                    fontSize: 22.toFont,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 40.toHeight),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 70.toWidth,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Divider(
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.toWidth),
                                        child: Text(
                                          "Or",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2
                                              .copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey[500],
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Divider(
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 30.toHeight),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(AllImages().facebook),
                                    SizedBox(width: 30.toWidth),
                                    SvgPicture.asset(AllImages().google),
                                  ],
                                ),
                                SizedBox(height: 30.toHeight),
                                Center(
                                  child: CustomButton(
                                    isSecondary: false,
                                    onTap: () {},
                                    text: "Sign up",
                                  ),
                                ),
                                Spacer(
                                  flex: 2,
                                ),
                                SizedBox(height: 10.toHeight),
                                Center(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Already have an account ? ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(
                                            fontWeight: FontWeight.normal,
                                          ),
                                      children: [
                                        TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.pushNamed(
                                                  context, '/login');
                                            },
                                          text: "Sign in",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2
                                              .copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
