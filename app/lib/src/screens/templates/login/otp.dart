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
                        "Log in with mobile",
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
                                  "Enter OTP",
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                SizedBox(
                                  height: 13.toHeight,
                                ),
                                Text(
                                  "Enter the 6-digit OTP to continue !",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 40.toHeight,
                                ),
                                OTPTextField(
                                  length: 6,
                                  width: MediaQuery.of(context).size.width,
                                  textFieldAlignment:
                                      MainAxisAlignment.spaceAround,
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
                                Spacer(
                                  flex: 2,
                                ),
                                SizedBox(height: 10.toHeight),
                                Center(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Not received code? ',
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
                                              //
                                            },
                                          text: "Resend OTP",
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
      // body: SingleChildScrollView(
      //   child: Container(
      //     width: double.infinity,
      //     padding: EdgeInsets.symmetric(
      //         horizontal: 30.toWidth, vertical: 15.toHeight),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Text(
      //           "Enter OTP",
      //           style: Theme.of(context).textTheme.headline2.copyWith(),
      //         ),
      //         SizedBox(
      //           height: 15.toHeight,
      //         ),
      //         Text(
      //           "Please enter the 6-digit OTP",
      //           style: TextStyle(fontWeight: FontWeight.w300),
      //         ),
      //         SizedBox(
      //           height: 40.toHeight,
      //         ),
      //         OTPTextField(
      //           length: 6,
      //           width: MediaQuery.of(context).size.width,
      //           textFieldAlignment: MainAxisAlignment.spaceAround,
      //           fieldWidth: 50,
      //           fieldStyle: FieldStyle.underline,
      //           style: TextStyle(fontSize: 17),
      //           onChanged: (pin) {
      //             //  will be triggered on change of any OTP field data
      //           },
      //           onCompleted: (pin) {
      //             // Will be triggered when user enters the complete OTP
      //           },
      //         ),
      //         SizedBox(height: 40.toHeight),
      //         Center(
      //           child: CustomButton(
      //             isSecondary: false,
      //             onTap: () {},
      //             text: "Submit",
      //           ),
      //         ),
      //         SizedBox(height: 20.toHeight),
      //         Center(
      //           child: RichText(
      //             text: TextSpan(
      //               text: 'Not Recieved Code?  ',
      //               style: Theme.of(context).textTheme.bodyText2.copyWith(
      //                     fontWeight: FontWeight.normal,
      //                   ),
      //               children: [
      //                 TextSpan(
      //                   recognizer: TapGestureRecognizer()
      //                     ..onTap = () {
      //                       //Add Resend Otp Code
      //                     },
      //                   text: "Resend",
      //                   style: Theme.of(context).textTheme.bodyText2.copyWith(
      //                         fontWeight: FontWeight.w700,
      //                         color: Theme.of(context).primaryColor,
      //                       ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
