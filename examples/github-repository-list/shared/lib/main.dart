import 'package:shared_preferences/shared_preferences.dart';

export 'package:shared/modules/authentication/auth.dart';
export 'package:shared/modules/authentication/bloc/bloc_controller.dart';
export 'package:shared/modules/github_repo/bloc/github_repo_bloc_controller.dart';

Future<SharedPreferences> prefs = SharedPreferences.getInstance();
