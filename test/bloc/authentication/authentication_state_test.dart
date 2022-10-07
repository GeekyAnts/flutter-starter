// ignore_for_file: prefer_const_constructors

import 'package:flutter_starter/common_export.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthenticationState', () {
    test('test value comparisons of loading state', () {
      expect(
        AuthenticationLoading(),
        AuthenticationLoading(),
      );
    });

    test('test value comparisons of authenticated state', () {
      expect(
        AppAutheticated(),
        AppAutheticated(),
      );
    });

    test('test value comparisons of logout state', () {
      expect(
        UserLogoutState(),
        UserLogoutState(),
      );
    });
  });
}
