import '../../flutter_starter.dart';

enum AppTheme { light, dark }

/// ThemeProvider is responsible for updating the app theme
/// from light to dark and vice versa.
class ThemeProvider extends BaseProvider {
  AppTheme appTheme = AppTheme.light;
  void setTheme(AppTheme theme) {
    appTheme = theme;
    notifyListeners();
  }
}
