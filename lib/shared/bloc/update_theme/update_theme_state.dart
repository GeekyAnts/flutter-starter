import 'package:equatable/equatable.dart';

import '../../../flutter_starter.dart';

abstract class UpdateThemeState extends Equatable {
  const UpdateThemeState();
  @override
  List<AppTheme> get props => [];
}

class SetTheme extends UpdateThemeState {
  final AppTheme appTheme;
  const SetTheme({required this.appTheme});
  @override
  List<AppTheme> get props => [appTheme];
}
