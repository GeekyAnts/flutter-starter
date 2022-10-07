import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'common_export.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateThemeBloc, UpdateThemeState>(
      builder: (context, state) {
        /// Without go_router we should return MaterialApp() with
        /// {onGenerateRoute: routes}
        /// routes from routes.dart
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Hello World!',
          theme: ThemeConfig.lightTheme,
          darkTheme: ThemeConfig.darkTheme,
          themeMode: state is SetTheme
              ? state.appTheme == AppTheme.light
                  ? ThemeMode.light
                  : ThemeMode.dark
              : ThemeMode.light,
          // onGenerateRoute: routes,
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
