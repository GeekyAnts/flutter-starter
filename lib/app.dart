import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_starter/flutter_starter.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        /// Without go_router we should return MaterialApp() with
        /// {onGenerateRoute: routes}
        /// routes from routes.dart
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Hello World!',
          theme: ThemeConfig.lightTheme,
          darkTheme: ThemeConfig.darkTheme,

          /// Theme will be changed based on theme provider
          themeMode: provider.appTheme == AppTheme.light
              ? ThemeMode.light
              : ThemeMode.dark,

          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          routeInformationProvider: router.routeInformationProvider,

          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          // locale: const Locale('fr'),
        );
      },
    );
  }
}
