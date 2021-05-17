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
              horizontal: 20.toWidth, vertical: 12.toHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter OTP",
                style: Theme.of(context).textTheme.headline2.copyWith(
                      fontSize: 28.toFont,
                    ),
              ),
              SizedBox(
                height: 13.toHeight,
              ),
              Text(
                "Please enter the 6-digit OTP",
                style:
                    TextStyle(fontWeight: FontWeight.w300, fontSize: 14.toFont),
              ),
              SizedBox(
                height: 30.toHeight,
              ),
              OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 50.toWidth,
                fieldStyle: FieldStyle.underline,
                style: TextStyle(fontSize: 17.toFont),
                onChanged: (pin) {
                  //  will be triggered on change of any OTP field data
                },
                onCompleted: (pin) {
                  // Will be triggered when user enters the complete OTP
                },
              ),
              SizedBox(height: 30.toHeight),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    enableFeedback: true,
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColorDark,
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(
                          horizontal: 90.toWidth, vertical: 15.toHeight),
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
                    "Submit",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              SizedBox(height: 10.toHeight),
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
