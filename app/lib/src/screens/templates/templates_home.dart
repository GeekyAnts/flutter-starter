import 'package:app/src/screens/templates/chat/models/chat.dart';
import 'package:app/src/screens/templates/delivery/dashboard.dart';
import 'package:app/src/screens/templates/login/welcome.dart';
import 'package:app/src/screens/templates/news/news.dart';
import 'package:app/src/screens/templates/payment/payments.dart';
import 'package:app/src/screens/templates/profile/profile.dart';
import 'package:app/src/screens/templates/side_drawer/side_drawer.dart';
import 'package:flutter/material.dart';

class TemplatesHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map> _templates = [
      {'title': 'Login Module', 'path': '/welcome'},
      {'title': 'Delivery App', 'path': '/delivery'},
      {'title': 'Chat App', 'path': '/chat'},
      {'title': 'Payment', 'path': '/payment'},
      {'title': 'Profile', 'path': '/profile'},
      {'title': 'Side Drawer', 'path': '/side-drawer'},
      {'title': 'News', 'path': '/news'},
    ];

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        title: Text('Templates Home'),
      ),
      body: ListView.builder(
        itemCount: _templates.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              Icons.apps,
              size: 20,
            ),
            title: Text(_templates[index]['title']),
            onTap: () {
              Navigator.pushNamed(context, _templates[index]['path']);
            },
            trailing: Icon(Icons.chevron_right, size: 20),
          );
        },
      ),
    );
  }
}
