import 'package:equatable/equatable.dart';

abstract class UpdateThemeState extends Equatable {
  const UpdateThemeState();
  @override
  List<bool> get props => [];
}

class SetTheme extends UpdateThemeState {
  final bool isLightTheme;
  const SetTheme({required this.isLightTheme});
  @override
  List<bool> get props => [isLightTheme];
}
