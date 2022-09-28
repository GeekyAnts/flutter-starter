import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/flutter_starter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late final AuthenticationBloc authenticationBloc;
  late final UpdateThemeBloc updateThemeBloc;
  late final AuthenticationRepository authenticationService;

  setUpAll(() async {
    await SharedPrefs.instance.init();
    authenticationService = AuthenticationRepository();
    updateThemeBloc = UpdateThemeBloc();
    authenticationBloc = AuthenticationBloc(
      authenticationService: authenticationService,
    );
  });

  tearDownAll(() {
    authenticationBloc.close();
    updateThemeBloc.close();
  });

  Widget createWidget(Widget child) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        UiSizeConfig().init(context);
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: authenticationBloc),
            BlocProvider.value(value: updateThemeBloc),
          ],
          child: child,
        );
      }),
    );
  }

  group('Flutter starter', () {
    testWidgets('Complete app test', (tester) async {
      await tester.pumpWidget(createWidget(const App()));

      await tester.pumpAndSettle();
      await Future.delayed(const Duration(milliseconds: 500));
      await tester.pumpAndSettle();

      final Finder email = find.byKey(const Key('emailField'));
      final Finder password = find.byKey(const Key('passwordField'));
      final Finder login = find.byKey(const Key('loginButton'));
      final Finder theme = find.byKey(const Key('themeSwitch'));
      final Finder logout = find.byKey(const Key('logoutButton'));

      /// Empty
      await tester.enterText(email, '');
      await tester.enterText(password, '');

      await tester.tap(login);
      await tester.pumpAndSettle();

      expect(authenticationBloc.state, const AuthenticationStart());

      /// Invalid
      await tester.enterText(email, 'test@gmail.com');
      await tester.enterText(password, 'test1234');

      await tester.tap(login);
      await tester.pumpAndSettle();

      expect(
        authenticationBloc.state,
        const AuthenticationFailure(
            message: 'Invalid Request: {"error":"user not found"}'),
      );

      /// Login
      await tester.enterText(email, 'eve.holt@reqres.in');
      await tester.enterText(password, 'cityslicka');

      await tester.tap(login);
      await tester.pumpAndSettle();

      /// Theme
      final ScaffoldState state = tester.firstState(find.byType(Scaffold));
      state.openDrawer();
      await tester.pumpAndSettle();
      await tester.tap(theme);
      await tester.pumpAndSettle();

      state.closeDrawer();
      await tester.pumpAndSettle();

      expect(updateThemeBloc.state, const SetTheme(appTheme: AppTheme.dark));

      /// Logout
      await tester.tap(logout);
      await tester.pumpAndSettle();

      expect(authenticationBloc.state, const UserLogoutState());
    });
  });
}
