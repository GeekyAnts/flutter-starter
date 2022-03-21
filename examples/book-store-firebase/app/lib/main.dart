import 'package:app/src/app.dart';
import 'package:app/src/utils/app_state_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(
    ChangeNotifierProvider<AppStateNotifier>(
      create: (_) => AppStateNotifier(),
      child: App(),
    ),
  );
}
