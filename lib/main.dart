import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/flutter_starter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => AuthenticationBloc(),
        ),
        BlocProvider<UpdateThemeBloc>(
          create: (BuildContext context) => UpdateThemeBloc(),
        ),
      ],
      child: const App(),
    ),
  );
}
