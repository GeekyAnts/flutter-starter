import 'package:flutter/material.dart';
import 'package:app/src/utils/size_utils.dart';

class Tile extends StatelessWidget {
  final IconData icon;
  final String text;

  const Tile({Key key, this.icon, this.text}) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12.toHeight, bottom: 12.toHeight),
      margin: EdgeInsets.only(bottom: 12.toHeight),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.65),
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 25,
            color: Colors.black.withOpacity(0.65),
          ),
          SizedBox(width: 20.toWidth),
          Expanded(
            child: Container(
              child: Text(
                text,
                style: Theme.of(context).textTheme.headline4.copyWith(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[800],
                    ),
                softWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
