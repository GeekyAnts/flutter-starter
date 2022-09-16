import 'package:equatable/equatable.dart';

abstract class UpdateThemeEvent extends Equatable {
  const UpdateThemeEvent();

  @override
  List<bool> get props => [];
}

class UpdateTheme extends UpdateThemeEvent {
  final bool isLightTheme;
  const UpdateTheme({required this.isLightTheme});

  @override
  List<bool> get props => [isLightTheme];
}
