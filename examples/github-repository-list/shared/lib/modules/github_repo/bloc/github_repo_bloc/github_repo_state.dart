import 'package:equatable/equatable.dart';
import 'package:shared/modules/github_repo/models/repo.dart';

abstract class GithubRepoState extends Equatable {
  const GithubRepoState();

  @override
  List<Object> get props => [];
}

class GithubRepoStateInitial extends GithubRepoState {}

class GithubRepoStateLoading extends GithubRepoState {}

class GithubRepoDataLoadedState extends GithubRepoState {
  final List<Repo> repositoryData;
  GithubRepoDataLoadedState({this.repositoryData});
  @override
  List<Object> get props => [repositoryData];
}
