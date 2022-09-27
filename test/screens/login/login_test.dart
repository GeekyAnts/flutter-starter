import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/flutter_starter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

void main() {
  late AuthenticationBloc authenticationBloc;

  setUp(() async {
    authenticationBloc = MockAuthenticationBloc();
  });

  tearDown(() {
    authenticationBloc.close();
  });

  Widget createWidget(Widget child) {
    return MaterialApp(
      home: Builder(builder: (context) {
        UiSizeConfig().init(context);
        return BlocProvider.value(
          value: authenticationBloc,
          child: child,
        );
      }),
    );
  }

  group('Login test', () {
    testWidgets('when invalid credentials are provided',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        const emailText = '';
        const passwordText = '';

        when(() => authenticationBloc.state)
            .thenReturn(const AuthenticationInitial());

        await tester.pumpWidget(createWidget(const LoginScreen()));
        final Finder email = find.byKey(const Key('emailField'));
        await tester.enterText(email, emailText);
        final Finder password = find.byKey(const Key('passwordField'));
        await tester.enterText(password, passwordText);
        final Finder login = find.byKey(const Key('loginButton'));
        await tester.tap(login);
        await tester.pump();

        verifyNever(() => authenticationBloc.add(
              const UserLogin(email: emailText, password: passwordText),
            ));
      });
    });

    testWidgets('when valid credentials are provided',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        const emailText = 'eve.holt@reqres.in';
        const passwordText = 'cityslicka';

        when(() => authenticationBloc.state)
            .thenReturn(const AuthenticationInitial());

        await tester.pumpWidget(createWidget(const LoginScreen()));
        final Finder email = find.byKey(const Key('emailField'));
        await tester.enterText(email, emailText);
        final Finder password = find.byKey(const Key('passwordField'));
        await tester.enterText(password, passwordText);
        final Finder login = find.byKey(const Key('loginButton'));
        await tester.tap(login);
        await tester.pump();

        verify(() => authenticationBloc.add(
              const UserLogin(email: emailText, password: passwordText),
            )).called(1);
      });
    });
  });
}
