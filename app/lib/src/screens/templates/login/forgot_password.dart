import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
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
                "Forgot Password",
                style: Theme.of(context).textTheme.headline2.copyWith(
                      fontSize: 28,
                    ),
              ),
              SizedBox(
                height: 13,
              ),
              Text(
                "Please enter your registered email address.",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
              ),
              SizedBox(
                height: 30,
              ),
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
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    enableFeedback: true,
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColorDark,
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Navigator.pushNamed(context, '/login');
                  },
                  child: Text(
                    "Send Reset Link",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
