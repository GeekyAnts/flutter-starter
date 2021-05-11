import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Keep Connected",
                style: Theme.of(context).textTheme.headline2.copyWith(
                      fontSize: 28,
                    ),
              ),
              SizedBox(
                height: 13,
              ),
              Text(
                "Enter your email address and password to login into your account.",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    autofocus: true,
                    autocorrect: false,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      labelText: 'Email Address',
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        size: 25,
                      ),
                      filled: false,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    autofocus: true,
                    autocorrect: false,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        size: 25,
                      ),
                      filled: false,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Theme(
                      data: ThemeData(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _value = !_value;
                          });
                        },
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: _value
                                    ? Icon(
                                        Icons.check,
                                        size: 18.0,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.check_box_outline_blank,
                                        size: 18.0,
                                        color: Colors.green,
                                      ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Remember Me',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Theme(
                      data: ThemeData(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/forgot-password');
                        },
                        child: Text(
                          'Forgot Password?',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        enableFeedback: true,
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).primaryColorDark,
                        ),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      onPressed: () {
                        // Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        "Login Now",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        enableFeedback: true,
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.white,
                        ),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        "Create Account",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.black),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
