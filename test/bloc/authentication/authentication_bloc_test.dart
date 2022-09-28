import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_starter/flutter_starter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  group('AuthenticationBloc', () {
    late AuthenticationBloc authenticationBloc;
    late AuthenticationRepository authenticationService;
    late SharedPrefs prefs;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      prefs = SharedPrefs.instance;
      await prefs.init();
      authenticationService = MockAuthenticationRepository();
      authenticationBloc = AuthenticationBloc(
        authenticationService: authenticationService,
      );
    });

    tearDown(() {
      authenticationBloc.close();
      prefs.clear();
    });

    blocTest<AuthenticationBloc, AuthenticationState>(
      'test initial state of the bloc',
      build: () => authenticationBloc,
      verify: (bloc) => bloc.state == const AuthenticationInitial(),
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'when auth token is null',
      build: () {
        prefs.remove('authtoken');
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(const AppLoadedup()),
      wait: const Duration(milliseconds: 500),
      expect: () {
        return [
          const AuthenticationLoading(),
          const AuthenticationStart(),
        ];
      },
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'when auth token is not null',
      build: () {
        prefs.setToken('authtoken');
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(const AppLoadedup()),
      wait: const Duration(milliseconds: 500),
      expect: () {
        return [
          const AuthenticationLoading(),
          const AppAutheticated(),
        ];
      },
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'when user signup failed',
      build: () {
        when(() => authenticationService.signUpWithEmailAndPassword(
            'test@gmail.in', 'test1234')).thenAnswer(
          (invocation) => Future.value({'error': 'already registered'}),
        );
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(
        const UserSignUp(email: 'test@gmail.in', password: 'test1234'),
      ),
      wait: const Duration(milliseconds: 500),
      expect: () {
        return [
          const AuthenticationLoading(),
          const AuthenticationFailure(message: 'already registered'),
        ];
      },
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'when user signup success',
      build: () {
        when(() => authenticationService.signUpWithEmailAndPassword(
            'eve.holt@reqres.in', 'cityslicka')).thenAnswer(
          (invocation) => Future.value({'id': 1, 'token': 'abc'}),
        );
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(
        const UserSignUp(email: 'eve.holt@reqres.in', password: 'cityslicka'),
      ),
      wait: const Duration(milliseconds: 500),
      expect: () {
        return [
          const AuthenticationLoading(),
          const AppAutheticated(),
        ];
      },
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'when user login failed',
      build: () {
        when(() => authenticationService.loginWithEmailAndPassword(
            'test@gmail.in', 'test1234')).thenAnswer(
          (invocation) => Future.value({'error': 'user not found'}),
        );
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(
        const UserLogin(email: 'test@gmail.in', password: 'test1234'),
      ),
      wait: const Duration(milliseconds: 500),
      expect: () {
        return [
          const AuthenticationLoading(),
          const AuthenticationFailure(message: 'user not found'),
        ];
      },
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'when user login success',
      build: () {
        when(() => authenticationService.loginWithEmailAndPassword(
            'eve.holt@reqres.in', 'cityslicka')).thenAnswer(
          (invocation) => Future.value({'token': 'abc'}),
        );
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(
        const UserLogin(email: 'eve.holt@reqres.in', password: 'cityslicka'),
      ),
      wait: const Duration(milliseconds: 500),
      expect: () {
        return [
          const AuthenticationLoading(),
          const AppAutheticated(),
        ];
      },
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'when user logout',
      build: () => authenticationBloc,
      act: (bloc) => bloc.add(const UserLogOut()),
      wait: const Duration(milliseconds: 500),
      expect: () {
        return [
          const AuthenticationLoading(),
          const UserLogoutState(),
        ];
      },
    );
  });
}
