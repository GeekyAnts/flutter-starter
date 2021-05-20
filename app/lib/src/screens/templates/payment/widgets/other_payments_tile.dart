import 'package:app/src/utils/size_utils.dart';
import 'package:flutter/material.dart';

class OtherPaymentTile extends StatelessWidget {
  final IconData leadingIcon, actionIcon;
  final String text;

  const OtherPaymentTile(
      {Key key, this.leadingIcon, this.actionIcon, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 15.toHeight,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 30.toWidth,
        vertical: 30.toHeight,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]),
        borderRadius: BorderRadius.circular(5),
      ),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(leadingIcon, color: Colors.grey[800], size: 20),
          SizedBox(width: 12.toWidth),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 26.toFont),
            ),
          ),
          SizedBox(width: 10.toWidth),
          Icon(actionIcon, color: Colors.grey[800], size: 20),
        ],
      ),
    );
  }
}
