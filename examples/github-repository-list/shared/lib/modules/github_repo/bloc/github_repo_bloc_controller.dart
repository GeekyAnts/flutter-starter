import 'package:shared/modules/github_repo/bloc/github_repo_bloc/github_repo_bloc.dart';

export 'package:shared/modules/github_repo/bloc/github_repo_bloc/github_repo_public.dart';

class GithubRepoBlocController {
  static GithubRepoBlocController _instance = GithubRepoBlocController._();
  // ignore: close_sinks
  GithubRepoBloc authenticationBloc = GithubRepoBloc();
  factory GithubRepoBlocController() => _instance;

  GithubRepoBlocController._();
}
