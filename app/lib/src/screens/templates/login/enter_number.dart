import 'package:app/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:app/src/utils/size_utils.dart';

class EnterNumber extends StatelessWidget {
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
          padding: EdgeInsets.symmetric(
              horizontal: 30.toWidth, vertical: 15.toHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login with Number",
                style: Theme.of(context).textTheme.headline2.copyWith(),
              ),
              SizedBox(
                height: 13.toHeight,
              ),
              Text(
                "Please enter your registered mobile number.",
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 40.toHeight,
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
                  labelText: 'Mobile Number',
                  prefixIcon: Icon(
                    Icons.phone,
                    size: 25,
                  ),
                  filled: false,
                ),
              ),
              SizedBox(height: 30.toHeight),
              Center(
                child: CustomButton(
                  isSecondary: false,
                  onTap: () => Navigator.pushNamed(context, '/otp'),
                  text: "Send OTP",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
