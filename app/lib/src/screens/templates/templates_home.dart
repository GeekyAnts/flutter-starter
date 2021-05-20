import 'package:app/src/screens/templates/chat/models/chat.dart';
import 'package:app/src/screens/templates/chat/widgets/chat_tile.dart';
import 'package:app/src/screens/templates/delivery/dashboard.dart';
import 'package:app/src/screens/templates/login/welcome.dart';
import 'package:app/src/screens/templates/news/news.dart';
import 'package:app/src/screens/templates/payment/payments.dart';
import 'package:app/src/screens/templates/profile/profile.dart';
import 'package:app/src/utils/size_utils.dart';
import 'package:flutter/material.dart';

class TemplatesHome extends StatelessWidget {
  List<Map> _templates = [
    {'title': 'Login Module', 'widget': WelcomeScreen(), 'path': '/welcome'},
    {
      'title': 'Delivery App',
      'widget': DeliveryDashboard(),
      'path': '/delivery'
    },
    {'title': 'Chat App', 'widget': Chat(), 'path': '/chat'},
    {'title': 'Payment', 'widget': Payments(), 'path': '/payment'},
    {'title': 'Profile', 'widget': ProfileScreen(), 'path': '/profile'},
    {'title': 'News', 'widget': News(), 'path': '/news'},
  ];
  @override
  Widget build(BuildContext context) {
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
