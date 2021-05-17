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
              horizontal: 20.toWidth, vertical: 12.toHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login with Number",
                style: Theme.of(context).textTheme.headline2.copyWith(
                      fontSize: 28.toFont,
                    ),
              ),
              SizedBox(
                height: 13.toHeight,
              ),
              Text(
                "Please enter your registered mobile number.",
                style:
                    TextStyle(fontWeight: FontWeight.w300, fontSize: 14.toFont),
              ),
              SizedBox(
                height: 30.toHeight,
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
                    Navigator.pushNamed(context, '/otp');
                  },
                  child: Text(
                    "Send OTP",
                    style: Theme.of(context).textTheme.bodyText1,
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
