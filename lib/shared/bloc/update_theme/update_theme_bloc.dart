import 'package:bloc/bloc.dart';
import 'package:flutter_starter/flutter_starter.dart';

class UpdateThemeBloc extends Bloc<UpdateThemeEvent, UpdateThemeState> {
  UpdateThemeBloc() : super(const SetTheme(isLightTheme: true)) {
    on<UpdateThemeEvent>((event, emit) {
      if (event is UpdateTheme) {
        emit(SetTheme(isLightTheme: event.isLightTheme));
      }
    });
  }
}
