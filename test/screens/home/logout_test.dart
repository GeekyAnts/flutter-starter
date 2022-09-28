import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/flutter_starter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

class MockUpdateThemeBloc extends MockBloc<UpdateThemeEvent, UpdateThemeState>
    implements UpdateThemeBloc {}

void main() {
  late AuthenticationBloc authenticationBloc;
  late UpdateThemeBloc updateThemeBloc;

  setUp(() async {
    authenticationBloc = MockAuthenticationBloc();
    updateThemeBloc = MockUpdateThemeBloc();
  });

  tearDown(() {
    authenticationBloc.close();
    updateThemeBloc.close();
  });

  Widget createWidget(Widget child) {
    return MaterialApp(
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

  group('Authentication check', () {
    testWidgets('when user logout', (WidgetTester tester) async {
      when(() => authenticationBloc.state).thenReturn(
        SetUserData(
          currentUserData: CurrentUserData(
            data:
                Data(id: 0, email: '', firstName: '', lastName: '', avatar: ''),
            support: Support(url: '', text: ''),
          ),
        ),
      );
      when(() => updateThemeBloc.state).thenReturn(
        const SetTheme(appTheme: AppTheme.light),
      );

      await tester.pumpWidget(createWidget(const HomeScreen()));
      final Finder logout = find.byKey(const Key('logoutButton'));
      await tester.tap(logout);
      await tester.pump();

      verify(() => authenticationBloc.add(const UserLogOut())).called(1);
    });
  });
}
