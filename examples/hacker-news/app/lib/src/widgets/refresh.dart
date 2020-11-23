import 'package:flutter/material.dart';
import 'package:shared/main.dart';

class Refresh extends StatelessWidget {
  final child;

  Refresh({this.child});

  Widget build(context) {
    final bloc = StoriesProvider.of(context);

    return RefreshIndicator(
      child: child,
      onRefresh: () async {
        await bloc.clearCache();
        await bloc.fetchTopIds();
      },
    );
  }
}
