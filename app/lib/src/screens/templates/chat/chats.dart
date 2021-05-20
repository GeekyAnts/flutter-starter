import 'package:app/src/screens/templates/chat/models/chat.dart';
import 'package:app/src/screens/templates/chat/widgets/chat_tile.dart';
import 'package:app/src/utils/size_utils.dart';
import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.west),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('ChatApp'),
        centerTitle: false,
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
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.toWidth),
            child: Divider(
              color: Theme.of(context).primaryColor,
            ),
          );
        },
      ),
    );
  }
}
