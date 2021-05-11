import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final IconData icon;
  final String text;

  const Tile({Key key, this.icon, this.text}) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom:
              BorderSide(color: Theme.of(context).primaryColorLight, width: 1),
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
          SizedBox(width: 20),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Text(
              text,
              style: Theme.of(context).textTheme.headline4.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Colors.grey[800],
                  ),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
