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
      width: MediaQuery.of(context).size.width / 2,
      child: ElevatedButton(
        style: ButtonStyle(
          enableFeedback: true,
          backgroundColor: isSecondary
              ? MaterialStateProperty.all<Color>(
                  Theme.of(context).canvasColor,
                )
              : MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColorDark,
                ),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 25.toHeight),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
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
