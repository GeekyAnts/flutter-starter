import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget{
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        ListTile(
          title: buildContainer(),
          subtitle: buildContainer(),
        )
      ],
    );
  }

  Widget buildContainer(){
    return Container(
      color: Colors.grey[200],
      height: 24.0,
      width: 150.0,
      margin: EdgeInsets.only(top: 5.0,bottom: 5.0),
    );
  }
}