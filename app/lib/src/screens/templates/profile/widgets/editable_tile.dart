import 'package:flutter/material.dart';

class EditableTile extends StatelessWidget {
  final IconData icon;
  final TextEditingController text;

  const EditableTile({Key key, this.icon, this.text}) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      margin: EdgeInsets.only(bottom: 8),
      child: TextField(
        controller: text,
        keyboardType: TextInputType.text,
        autocorrect: false,
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.headline5.copyWith(
              fontWeight: FontWeight.w500,
            ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            size: 25,
          ),
          filled: false,
        ),
      ),
    );
  }
}
