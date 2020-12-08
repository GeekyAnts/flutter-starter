export 'package:shared/modules/authentication/auth.dart';
export 'package:shared/modules/authentication/bloc/bloc_controller.dart';
export 'package:shared/modules/weather_app/bloc/weather_bloc_public.dart';
export 'package:shared/modules/weather_app/models/weather_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> prefs = SharedPreferences.getInstance();
