import 'package:flutter/material.dart';

class ShowCards extends StatefulWidget {
  @override
  _ShowCardsState createState() => _ShowCardsState();
}

class _ShowCardsState extends State<ShowCards> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-card');
        },
        child: Text("Madhav"));
  }
}
