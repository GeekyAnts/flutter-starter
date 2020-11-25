import 'package:app/src/config/theme_data.dart';
import 'package:app/src/routes/index.dart';
import 'package:app/src/utils/app_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared/main.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => locator<FirebaseCRUDoperations>(),
          ),
        ],
        child: MaterialApp(
          title: 'News!',
          theme: ThemeConfig.lightTheme,
          darkTheme: ThemeConfig.darkTheme,
          themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          onGenerateRoute: routes,
        ),
      );
    });
  }
}
