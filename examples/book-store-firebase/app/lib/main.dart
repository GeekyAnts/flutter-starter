import 'package:app/src/app.dart';
import 'package:app/src/utils/app_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared/main.dart';

void main() {
  setupLocator();
  runApp(
    ChangeNotifierProvider<AppStateNotifier>(
      create: (_) => AppStateNotifier(),
      child: App(),
    ),
  );
}
