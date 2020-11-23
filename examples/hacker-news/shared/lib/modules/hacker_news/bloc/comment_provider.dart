import 'package:flutter/material.dart';
import 'comments_bloc.dart';

class CommentsProvider extends InheritedWidget {
  final CommentsBloc comments;

  CommentsProvider({Key key, Widget child})
      : comments = CommentsBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static CommentsBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<CommentsProvider>())
        .comments;
  }
}
