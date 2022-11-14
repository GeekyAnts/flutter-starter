import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_theme_event.dart';
part 'update_theme_state.dart';

class UpdateThemeBloc extends Bloc<UpdateThemeEvent, UpdateThemeState> {
  UpdateThemeBloc() : super(const SetTheme(appTheme: AppTheme.light)) {
    on<UpdateThemeEvent>((event, emit) {
      if (event is UpdateTheme) {
        emit(SetTheme(appTheme: event.appTheme));
      }
    });
  }
}
