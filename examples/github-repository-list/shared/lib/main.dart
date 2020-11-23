export 'package:shared/modules/github_repo/resources/github_repo_resouces.dart';
export 'package:shared/modules/authentication/auth.dart';
export 'package:shared/modules/authentication/bloc/authentication_bloc_controller.dart';
export 'package:shared/modules/github_repo/bloc/github_repo_bloc/github_repo_public.dart';
export 'package:shared/modules/github_repo/bloc/github_repo_bloc_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> prefs = SharedPreferences.getInstance();
