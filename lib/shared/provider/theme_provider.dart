import 'package:flutter/material.dart';

import '../../flutter_starter.dart';

enum AppTheme { light, dark }

class ThemeProvider extends BaseProvider {
  AppTheme appTheme = AppTheme.light;
  void setTheme(AppTheme theme) {
    appTheme = theme;
    notifyListeners();
  }
}
