// ignore_for_file: prefer_const_constructors

import 'package:flutter_starter/flutter_starter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UpdateTheme', () {
    test('test value comparisons during light theme', () {
      expect(
        UpdateTheme(isLightTheme: true),
        UpdateTheme(isLightTheme: true),
      );
    });

    test('test value comparisons during dark theme', () {
      expect(
        UpdateTheme(isLightTheme: false),
        UpdateTheme(isLightTheme: false),
      );
    });
  });
}
