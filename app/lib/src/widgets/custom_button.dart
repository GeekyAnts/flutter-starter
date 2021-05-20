import 'package:flutter/material.dart';
import 'package:app/src/utils/size_utils.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isSecondary;
  final Function onTap;

  const CustomButton({Key key, this.text, this.onTap, this.isSecondary})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: EdgeInsets.symmetric(vertical: 25.toHeight),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            primary: isSecondary
                ? Theme.of(context).canvasColor
                : Theme.of(context).accentColor,
            side: !isSecondary
                ? BorderSide(
                    width: 1.0,
                    color: Colors.white,
                  )
                : BorderSide()),
        onPressed: onTap,
        child: Text(
          text,
          style: isSecondary
              ? Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.black)
              : Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
