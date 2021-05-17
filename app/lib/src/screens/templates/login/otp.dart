import 'package:app/src/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:app/src/utils/size_utils.dart';

class OTP extends StatelessWidget {
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
                "Enter OTP",
                style: Theme.of(context).textTheme.headline2.copyWith(),
              ),
              SizedBox(
                height: 15.toHeight,
              ),
              Text(
                "Please enter the 6-digit OTP",
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 40.toHeight,
              ),
              OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 50,
                fieldStyle: FieldStyle.underline,
                style: TextStyle(fontSize: 17),
                onChanged: (pin) {
                  //  will be triggered on change of any OTP field data
                },
                onCompleted: (pin) {
                  // Will be triggered when user enters the complete OTP
                },
              ),
              SizedBox(height: 40.toHeight),
              Center(
                child: CustomButton(
                  isSecondary: false,
                  onTap: () {},
                  text: "Submit",
                ),
              ),
              SizedBox(height: 20.toHeight),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Not Recieved Code?  ',
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            //Add Resend Otp Code
                          },
                        text: "Resend",
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
