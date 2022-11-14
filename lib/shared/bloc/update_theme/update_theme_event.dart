part of 'update_theme_bloc.dart';

enum AppTheme { light, dark }

abstract class UpdateThemeEvent extends Equatable {
  const UpdateThemeEvent();

  @override
  List<AppTheme> get props => [];
}

class UpdateTheme extends UpdateThemeEvent {
  final AppTheme appTheme;
  const UpdateTheme({required this.appTheme});

  @override
  List<AppTheme> get props => [appTheme];
}
