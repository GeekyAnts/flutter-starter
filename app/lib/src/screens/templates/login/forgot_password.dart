import 'package:app/src/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:app/src/utils/size_utils.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                        "Forgot Password",
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
                                  "Reset your password",
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                SizedBox(
                                  height: 13.toHeight,
                                ),
                                Text(
                                  "Enter your registered email address to continue !",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 40.toHeight,
                                ),
                                TextField(
                                  autofocus: true,
                                  keyboardType: TextInputType.text,
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
                                    labelText: 'Email Address',
                                    filled: false,
                                  ),
                                ),
                                SizedBox(height: 40.toHeight),
                                Center(
                                  child: CustomButton(
                                    isSecondary: false,
                                    onTap: () {
                                      //
                                    },
                                    text: "Send Reset Link",
                                  ),
                                ),
                                Spacer(
                                  flex: 2,
                                ),
                                SizedBox(height: 10.toHeight),
                                Center(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Do not have an account ? ',
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
                                                  context, '/signup');
                                            },
                                          text: "Sign up",
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
