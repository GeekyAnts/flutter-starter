import 'package:shared/main.dart';

class GithubRepoBlocController {
  GithubRepoBlocController._();
  static GithubRepoBlocController _instance = GithubRepoBlocController._();
  factory GithubRepoBlocController() => _instance;

  // ignore: close_sinks
  GithubRepoBloc authenticationBloc = GithubRepoBloc();
}
