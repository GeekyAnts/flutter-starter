// ignore_for_file: prefer_const_constructors

import 'package:flutter_starter/common_export.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthenticationEvent', () {
    test('test value comparisons of loading event', () {
      expect(
        AppLoadedup(),
        AppLoadedup(),
      );
    });

    test('test value comparisons of user data event', () {
      expect(
        GetUserData(),
        GetUserData(),
      );
    });

    test('test value comparisons of logout event', () {
      expect(
        UserLogOut(),
        UserLogOut(),
      );
    });
  });
}
