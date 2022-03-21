import 'package:shared_preferences/shared_preferences.dart';

export 'package:shared/modules/authentication/auth.dart';
export 'package:shared/modules/authentication/bloc/bloc_controller.dart';
export 'package:shared/modules/hacker_news/bloc/comment_provider.dart';
export 'package:shared/modules/hacker_news/bloc/comments_bloc.dart';
export 'package:shared/modules/hacker_news/bloc/stories_bloc.dart';
export 'package:shared/modules/hacker_news/bloc/stories_provider.dart';
export 'package:shared/modules/hacker_news/models/news_models_public.dart';

Future<SharedPreferences> prefs = SharedPreferences.getInstance();
