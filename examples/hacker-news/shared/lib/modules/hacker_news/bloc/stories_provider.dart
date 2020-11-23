import 'stories_bloc.dart';
import 'package:flutter/material.dart';

class StoriesProvider extends InheritedWidget {
  final StoriesBloc stories;

  StoriesProvider({Key key, Widget child})
      : stories = StoriesBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static StoriesBloc of(context) {
    return (context.dependOnInheritedWidgetOfExactType<StoriesProvider>())
        .stories;
  }
}
