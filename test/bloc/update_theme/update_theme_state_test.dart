// ignore_for_file: prefer_const_constructors

import 'package:flutter_starter/flutter_starter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SetTheme', () {
    test('test value comparisons during light theme', () {
      expect(
        SetTheme(appTheme: AppTheme.light),
        SetTheme(appTheme: AppTheme.light),
      );
    });

    test('test value comparisons during dark theme', () {
      expect(
        SetTheme(appTheme: AppTheme.dark),
        SetTheme(appTheme: AppTheme.dark),
      );
    });
  });
}
