import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/common_export.dart';
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

  group('Signup test', () {
    testWidgets('when invalid credentials are provided',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        const nameText = '';
        const emailText = '';
        const passwordText = '';

        when(() => authenticationBloc.state)
            .thenReturn(const AuthenticationInitial());

        await tester.pumpWidget(createWidget(const SignUpScreen()));
        final Finder name = find.byKey(const Key('nameField'));
        await tester.enterText(name, nameText);
        final Finder email = find.byKey(const Key('emailField'));
        await tester.enterText(email, emailText);
        final Finder password = find.byKey(const Key('passwordField'));
        await tester.enterText(password, passwordText);
        final Finder signup = find.byKey(const Key('signupButton'));
        await tester.tap(signup);
        await tester.pump();

        verifyNever(() => authenticationBloc.add(
              const UserSignUp(email: emailText, password: passwordText),
            ));
      });
    });

    testWidgets('when valid credentials are provided',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        const nameText = 'eve';
        const emailText = 'eve.holt@reqres.in';
        const passwordText = 'cityslicka';

        when(() => authenticationBloc.state)
            .thenReturn(const AuthenticationInitial());

        await tester.pumpWidget(createWidget(const SignUpScreen()));
        final Finder name = find.byKey(const Key('nameField'));
        await tester.enterText(name, nameText);
        final Finder email = find.byKey(const Key('emailField'));
        await tester.enterText(email, emailText);
        final Finder password = find.byKey(const Key('passwordField'));
        await tester.enterText(password, passwordText);
        final Finder signup = find.byKey(const Key('signupButton'));
        await tester.tap(signup);
        await tester.pump();

        verify(() => authenticationBloc.add(
              const UserSignUp(email: emailText, password: passwordText),
            )).called(1);
      });
    });
  });
}
