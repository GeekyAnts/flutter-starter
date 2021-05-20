import 'package:app/src/screens/templates/chat/models/chat.dart';
import 'package:app/src/screens/templates/chat/models/chat_message.dart';
import 'package:app/src/screens/templates/chat/widgets/chat_message_layout.dart';
import 'package:app/src/utils/size_utils.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  final Chat chat;

  const Messages({Key key, this.chat}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatAppBar(context),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://freepikpsd.com/wp-content/uploads/2019/10/android-app-background-images-png-6-Transparent-Images-Free.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            chatArea(context),
            userInput(context),
          ],
        ),
      ),
    );
  }

  AppBar chatAppBar(BuildContext context) {
    return AppBar(
      brightness: Brightness.dark,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.west),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://library.kissclipart.com/20180906/wtq/kissclipart-user-profile-clipart-user-profile-computer-icons-15b5c3086edf7512.png'),
          ),
          SizedBox(width: 20.toWidth),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                chat.name,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: 28.toFont,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              if (chat.isActive) SizedBox(height: 5.toHeight),
              if (chat.isActive)
                Text(
                  'Active now',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: 18.toFont,
                        fontWeight: FontWeight.w300,
                      ),
                ),
            ],
          )
        ],
      ),
      actions: [
        IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
        IconButton(icon: Icon(Icons.call), onPressed: () {}),
      ],
    );
  }

  Widget chatArea(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 15.toWidth, vertical: 15.toHeight),
        child: ListView.separated(
            itemCount: chatMessages.length,
            itemBuilder: (context, index) {
              return ChatMessageLayout(chatMessage: chatMessages[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 18.toHeight,
              );
            }),
      ),
    );
  }

  Widget userInput(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin:
            EdgeInsets.symmetric(horizontal: 12.toWidth, vertical: 10.toHeight),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: 12.toHeight, horizontal: 20.toWidth),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.emoji_emotions_outlined,
                      color: Colors.grey[700],
                      size: 30,
                    ),
                    SizedBox(width: 20.toWidth),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        maxLines: null,
                        autocorrect: false,
                        autofocus: false,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(fontSize: 25.toFont),
                        decoration: InputDecoration(
                          hintText: "Type a message",
                          hintStyle:
                              Theme.of(context).textTheme.bodyText2.copyWith(
                                    fontSize: 25.toFont,
                                    fontWeight: FontWeight.w300,
                                  ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.attach_file,
                          color: Colors.grey[700],
                          size: 28,
                        ),
                        SizedBox(width: 10.toWidth),
                        Icon(
                          Icons.camera_alt,
                          color: Colors.grey[700],
                          size: 28,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: 10.toWidth),
            Container(
              height: 100.toHeight,
              width: 100.toWidth,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
              child: Center(
                child: Icon(
                  Icons.mic,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
