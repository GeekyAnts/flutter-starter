import 'package:app/src/screens/templates/chat/models/chat_message.dart';
import 'package:app/src/utils/size_utils.dart';
import 'package:flutter/material.dart';

class ChatMessageLayout extends StatelessWidget {
  final ChatMessage chatMessage;

  const ChatMessageLayout({Key key, this.chatMessage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: chatMessage.isSender
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.66,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 25.toWidth,
            vertical: 15.toHeight,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            chatMessage.text,
            style: Theme.of(context).textTheme.headline6.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ],
    );
  }
}
