import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_starter/flutter_starter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UpdateThemeBloc', () {
    late UpdateThemeBloc updateThemeBloc;

    setUp(() async {
      updateThemeBloc = UpdateThemeBloc();
    });

    tearDown(() {
      updateThemeBloc.close();
    });

    blocTest<UpdateThemeBloc, UpdateThemeState>(
      'test initial state of the theme bloc',
      build: () => updateThemeBloc,
      verify: (bloc) => bloc.state == const SetTheme(appTheme: AppTheme.light),
    );

    blocTest<UpdateThemeBloc, UpdateThemeState>(
      'test when theme is changed',
      build: () => updateThemeBloc,
      act: (bloc) => bloc.add(const UpdateTheme(appTheme: AppTheme.dark)),
      expect: () => [const SetTheme(appTheme: AppTheme.dark)],
    );
  });
}
