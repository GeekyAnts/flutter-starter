import 'package:app/src/screens/templates/chat/models/chat.dart';
import 'package:app/src/screens/templates/chat/widgets/chat_tile.dart';
import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "ChatApp",
          style: Theme.of(context).textTheme.headline4,
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: ListView.separated(
        itemCount: chatListData.length,
        itemBuilder: (context, index) {
          return ChatTile(
            chat: chatListData[index],
            onpressed: () {
              Navigator.pushNamed(context, '/messages',
                  arguments: {'chat': chatListData[index]});
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.white,
          );
        },
      ),
    );
  }
}
